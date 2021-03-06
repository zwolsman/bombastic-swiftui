//
//  GameRow.swift
//  SwiftUI-4
//
//  Created by Marvin Zwolsman on 26/03/2020.
//  Copyright © 2020 Marvin Zwolsman. All rights reserved.
//

import SwiftUI

struct GameFieldRow: View {
    let tiles: ArraySlice<TileViewModel>
    
    var body: some View {
        HStack(spacing: 8.0) {
            ForEach(tiles) { tile in
                GameButton(model: tile)
            }
        }
    }
}

struct GameFieldRow_Previews: PreviewProvider {
    static var previews: some View {
        
        GameFieldRow(tiles: generateTiles())
            .aspectRatio(5/1, contentMode: .fit)
            .padding(32)
    }
}

private func generateTiles() -> ArraySlice<TileViewModel> {
    var tiles = [TileViewModel]()
          
    for i in 0..<5 {
        tiles.append(TileViewModel(tileState: .empty, color: Color.flatGreen, action: {
            tiles[i].state = .bomb
        }))
    }
    return tiles[0..<5]
}
