library(diagram)


### Name: straightarrow
### Title: adds straight arrow between two points
### Aliases: straightarrow
### Keywords: aplot

### ** Examples

openplotmat(main = "straightarrow")

pos <- coordinates(c(2, 3, 1))

for (i in 1:5) 
  straightarrow(from = pos[i, ], to = pos[i+1, ], arr.pos = 0.5)

straightarrow(from = pos[6, ], to = pos[6, ] + c(0.3, 0.), 
              arr.type = "T", arr.pos = 1, arr.lwd = 3)    

for (i in 1:6) 
  textrect(pos[i, ], lab = LETTERS[i], radx = 0.05)



