library(diagram)


### Name: bentarrow
### Title: adds 2-segmented arrow between two points
### Aliases: bentarrow
### Keywords: aplot

### ** Examples

openplotmat(main = "bentarrow")

pos <- cbind( A <- seq(0.1, 0.9, by = 0.2), rev(A))

text(pos, LETTERS[1:5], cex = 2)

for (i in 1:4) 
  bentarrow(from = pos[i,] + c(0.05, 0), to = pos[i+1,] + c(0, 0.05),
            arr.pos = 1, arr.adj = 1)

for (i in 1:2) 
  bentarrow(from = pos[i,] + c(0.05, 0), to = pos[i+1, ] + c(0, 0.05),
            arr.pos = 0.5, path = "V", lcol = "lightblue", 
            arr.type = "triangle")

bentarrow(from = pos[3, ] + c(0.05, 0), to = pos[4, ] + c(0, 0.05),
          arr.pos = 0.7, arr.side = 1, path = "V", lcol = "darkblue")

bentarrow(from = pos[4, ] + c(0.05, 0), to = pos[5, ] + c(0, 0.05),
          arr.pos = 0.7, arr.side = 1:2, path = "V", lcol = "blue")



