// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "FFmpeg-iOS-Support",
    platforms: [.iOS(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "FFmpeg-iOS-Support",
            targets: [
                "Depend", "Hook", "FFmpegSupport",
            ]),
    ],
    targets: [
        .target(name: "Depend",
                linkerSettings: [
                    .linkedLibrary("z"),
                    .linkedLibrary("bz2"),
                    .linkedLibrary("iconv"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("VideoToolbox"),
                    .linkedFramework("CoreMedia"),
                ]
        ),
        .target(name: "Hook", dependencies: [
            "Depend",
        ]),
        .target(name: "FFmpegSupport", dependencies: [
            "Hook",
        ]),
    ]
)
