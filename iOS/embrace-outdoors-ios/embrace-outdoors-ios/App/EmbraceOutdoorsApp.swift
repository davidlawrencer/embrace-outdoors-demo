//
//  embrace_outdoors_iosApp.swift
//  embrace-outdoors-ios
//
//  Created by David Rifkin on 8/13/24.
//

import SwiftUI
import EmbraceIO

@main
struct EmbraceOutdoorsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    init() {
        do {
            try Embrace.setup(
                options: Embrace.Options(
                    appId: "00000",
                    platform: .default,
                    export: nil
                )
            )
            .start()
            
            try? Embrace.client?.metadata.addProperty(
                key: "Experiment: Checkout Flow 2.0",
                value: Int.random(in: 0...10) < 8 ? "Control" : "Experiment",
                lifespan: .session
            )
            
        } catch let e {
            print("Couldn't initialize Embrace SDK: \(e.localizedDescription)")
        }
    }
}
