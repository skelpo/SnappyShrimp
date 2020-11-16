// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnappyShrimp",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SnappyShrimp",
            targets: ["SnappyShrimp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skelpo/ios-snapshot-test-case.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "Device",
            dependencies: [],
            path: "SnappyShrimp/Device"
        ),
        .target(
            name: "Logic",
            dependencies: [],
            path: "SnappyShrimp/Logic"
        ),
        .target(
            name: "SnappyShrimp",
            dependencies: [
                .product(name: "FBSnapshotTestCase", package: "ios-snapshot-test-case"),
                "Device",
                "Logic"
            ],
            path: "SnappyShrimp/Sources",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "SnappyShrimpTests",
            dependencies: ["SnappyShrimp"],
            path: "SnappyShrimpTests",
            exclude: ["Info.plist"]
        )
    ]
)
