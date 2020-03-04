// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "fluent",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "Fluent", targets: ["Fluent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/varungakhar/fluent-kit.git", .branch("vapor_fluent_kit")),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc.1"),
    ],
    targets: [
        .target(name: "Fluent", dependencies: [
            .product(name: "FluentKit", package: "fluent-kit"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "FluentTests", dependencies: [
            .target(name: "Fluent"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
