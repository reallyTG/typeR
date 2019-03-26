library(diagram)


### Name: selfarrow
### Title: adds a circular, self-pointing arrow to a plot
### Aliases: selfarrow
### Keywords: aplot

### ** Examples

openplotmat(main = "selfarrow")

pos <- coordinates(3, mx = 0.05)

text(pos, LETTERS[1:3], cex = 2)

for (i in 1:3) 
  selfarrow(pos = pos[i, ], path = "R", arr.pos = 0.2,
            curve = c(0.05, 0.1), lcol = "darkred")

for (i in 1:3) 
  selfarrow(pos = pos[i, ], path = "L", arr.pos = 0.7,
            lcol = "darkblue", curve = c(0.05, 0.05))

for (i in 1:3) 
  selfarrow(pos = pos[i, ], path = "L", arr.pos = 0.5,
            lcol = "darkgreen", code = i, arr.type = "triangle")



