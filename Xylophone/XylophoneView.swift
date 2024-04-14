//
//  XylophoneView.swift
//  Xylophone
//
//  Created by Adewale Sanusi on 06/04/2024.
//

import SwiftUI
import AVFoundation

struct XylophoneView: View {
    
    @State var player: AVAudioPlayer!
    
    func playNote(noteNumber: String) {
        guard let url = Bundle.main.url(forResource: "note\(noteNumber)", withExtension: "wav") else {
            // Handle the case where the resource is not found
            fatalError("Failed to locate the audio resource.")
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            // Handle any errors that occur during initialisation or playback
            print("Error initialising AVAudioPlayer: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            let colors: [Color] =
            [.red, .orange, .yellow, .green, .blue, .purple, .brown, .red]
            
            let noteSound = ["D", "R", "M", "F", "S", "L", "T", "D" ]
            
            let noteAlphabets = ["C", "D", "E", "F", "G", "A", "B", "C"]
            
            let decreaseWidthBy: [CGFloat] = [5.0, 15.0, 25.0, 35.0, 45.0, 55.0, 65.0, 75.0]
            
            ForEach(0..<min(colors.count, noteSound.count, noteAlphabets.count)) { index in
                
                Button(action: {
                    playNote(noteNumber: "\(index + 1)")
                    print("noteNumber: \(index + 1)")
                }) {
                    HStack {
                        Text(noteSound[index])
                            .font(.headline)
                            .foregroundStyle(Color.white.opacity(0.5))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text(noteAlphabets[index])
                            .font(.title)
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            
                    }
                    .padding()
                    .frame(maxWidth: (UIScreen.main.bounds.width - decreaseWidthBy[index]), maxHeight: .infinity)//
                .background(RoundedRectangle(cornerRadius: 10).fill(colors[index]))
                    
                }
                
            }
            
        }
        
    }
}

// Preview here should be lowercase
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        XylophoneView()
    }
}

