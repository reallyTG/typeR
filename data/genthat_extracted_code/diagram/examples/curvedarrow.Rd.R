library(diagram)


### Name: curvedarrow
### Title: adds curved arrow between two points
### Aliases: curvedarrow
### Keywords: aplot

### ** Examples

openplotmat(main = "curvedarrow")

pos <- coordinates(pos = 4, my = 0.2)
text(pos, LETTERS[1:4], cex = 2)

for (i in 1:3) 
  curvedarrow(from = pos[1, ] + c(0,-0.05), to = pos[i+1, ] + c(0,-0.05),
              curve = 0.5, arr.pos = 1)
for (i in 1:3) 
  curvedarrow(from = pos[1, ] + c(0, 0.05), to = pos[i+1, ] + c(0, 0.05),
              curve = -0.25, arr.adj = 1, arr.pos = 0.5, 
              arr.type = "triangle", arr.col = "blue")



