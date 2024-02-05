//
//  ContentView.swift
//  WeatherKitExample
//
//  Created by Kyeongmo Yang on 2/4/24.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    private func fetchWeather() async throws {
        let weatherService = WeatherService()
        let seoul = CLLocation(latitude: 37.514575, longitude: 127.0495556)
        do {
            let weather = try await weatherService.weather(for: seoul)
            let temperature = weather.currentWeather.temperature
            let uvIndex = weather.currentWeather.uvIndex
            
            print(temperature, uvIndex)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
