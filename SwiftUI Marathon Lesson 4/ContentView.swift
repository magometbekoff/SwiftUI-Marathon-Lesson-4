//
//  ContentView.swift
//  SwiftUI Marathon Lesson 4
//
//  Created by Magomet Bekov on 08.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tap = true
        var body: some View {
            Button {
                tap = true
                withAnimation(.interpolatingSpring(stiffness: 100, damping: 15)) {
                    tap.toggle()
                }
            } label: {
                ZStack {
                    Image(systemName: "play.fill")
                        .scaleEffect(
                            x: tap ? 0 : 1,
                            y: tap ? 0 : 1,
                            anchor: .trailing
                        )
                        .offset(x: tap ? 60 * -1 : 60 * -0.35)
                        .opacity(tap ? 0 : 1)
                    
                    HStack(spacing: 60 * -0.1) {
                        Image(systemName: "play.fill")
                            .offset(x: tap ? 0 : 60 * 0.75 )
                        
                        Image(systemName: "play.fill")
                            .opacity(tap ? 1 : 0)
                            .scaleEffect(tap ? 1 : 0)
                            .offset(x: tap ? 0 : 60 * 0.5)
                    }
                }
            }
            .buttonStyle(CustomButton())
        }
    }

struct CustomButton: PrimitiveButtonStyle {
    @State private var isAnimating = false
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .foregroundStyle(.black.opacity(0.2))
                .frame(width: 120)
                .opacity(isAnimating ? 0.5 : 0)

            configuration.label
                .font(.system(size: 60))
                .foregroundStyle(.blue)
                .onTapGesture {
                    configuration.trigger()
                    withAnimation(.spring(duration: 0.22)) {
                        isAnimating.toggle()
                    } completion: {
                        isAnimating = false
                    }
                }
        }
        .scaleEffect(isAnimating ? 0.86 : 1)
    }
}

#Preview {
    ContentView()
}
