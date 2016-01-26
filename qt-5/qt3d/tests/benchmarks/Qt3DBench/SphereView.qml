/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import Qt3D 2.0
import Qt3D.Renderer 2.0
import QtQuick 2.0 as QQ2

Entity {
    id: sceneRoot

    components: [
        Qt3DBenchFrameGraph {
            id: frameGraph
        }
    ]

    Configuration {
        controlledCamera: frameGraph.viewCamera
    }

    NodeInstantiator {
        id: spheres
        property int count: 900
        property real spacing: 2
        property int cols: 10
        property int rows: 9
        property int levelCount: cols * rows
        property int levels: 10

        model: count
        delegate: SphereElement {
            id: sphereEntity

            xPos: spheres.spacing * (index % spheres.cols - 0.5 * (spheres.cols - 1))
            yPos: spheres.spacing * (Math.floor(index / spheres.levelCount) - 0.5 * spheres.levels)
            zPos: spheres.spacing * (Math.floor((index % spheres.levelCount) / spheres.cols) - 0.5 * spheres.rows)
        }
    }
}