// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

/**
 * Copyright IBM Corporation 2016, 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import PackageDescription

let package = Package(
    name: "Kitura-Sample",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .branch("sampleJWT")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
        .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "8.0.0"),
        .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.1.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.9.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-Markdown.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-WebSocket.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsHTTP.git", from: "2.1.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-Session.git", from: "3.2.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsGoogle.git", from: "2.2.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CredentialsFacebook.git", from: "2.2.0"),
        .package(url: "https://github.com/Andrew-Lees11/appid-serversdk-swift.git", .branch("master")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", .upToNextMinor(from: "0.3.1")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL.git", from: "1.2.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-JWT", .branch("jwtCoder")),
    ],
    targets: [
        .target(name: "Kitura-Sample", dependencies: [ .target(name: "Application"), .target(name: "ChatService"), "Kitura" , "HeliumLogger"]),
        .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","SwiftMetrics","Health", "KituraOpenAPI", "KituraMarkdown", "KituraStencil", "CredentialsHTTP", "KituraSession", "CredentialsGoogle", "CredentialsFacebook", "IBMCloudAppID" , "SwiftKueryORM", "SwiftKueryPostgreSQL", "SwiftJWT"]),
        .target(name: "ChatService", dependencies: ["Kitura-WebSocket"]),
        .testTarget(name: "KituraSampleRouterTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ])
    ]
)
