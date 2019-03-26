library(diagram)


### Name: treearrow
### Title: adds a dendrogram-like branched arrow between several points
### Aliases: treearrow
### Keywords: aplot

### ** Examples

openplotmat(main = "treearrow")
pos <- coordinates(c(3, 2, 4, 1))
treearrow(from = pos[1:5, ], to = pos[6:10, ])
for (i in 1:10) 
  textrect(pos[i, ], lab = i, cex = 2, radx = 0.05)
  
openplotmat(main = "treearrow")
pos <- coordinates(c(2, 4), hor = FALSE)
treearrow(from = pos[1:2, ], to = pos[3:6, ], 
          arr.side = 1:2, path = "V")
for (i in 1:6) 
  textrect(pos[i, ], lab = i, cex = 2, radx = 0.05)
  
openplotmat(main = "treearrow")
pos <- coordinates(c(3, 5, 7, 7, 5, 3))
treearrow(from = pos[1:15, ], to = pos[15:30, ], arr.side = 0)
for (i in 1:30) 
  textrect(pos[i, ], lab = i, cex = 1.2, radx = 0.025)




