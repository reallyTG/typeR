library(diagram)


### Name: segmentarrow
### Title: adds 3-segmented arrow between two points.
### Aliases: segmentarrow
### Keywords: aplot

### ** Examples

openplotmat(main="segmentarrow")

pos <-cbind(A <- seq(0.2, 0.8, by = 0.2), rev(A))

text(pos, LETTERS[1:4], cex = 2)

segmentarrow(from = pos[1, ] + c(0, 0.05), to = pos[2, ] + c(0, 0.05),
             arr.pos = 1, arr.adj = 1, dd = 0.1, 
             path = "UHD", lcol = "darkred")

segmentarrow(from = pos[2, ] + c(-0.05, 0), to = pos[3, ] + c(-0.05, 0.01),
             arr.pos = 1, arr.adj = 1, dd = 0.1,
             lcol = "black", arr.type = "triangle")

segmentarrow(from = pos[2, ] + c(0.05, 0), to = pos[3, ] + c(0.05, 0.01),
             arr.pos = 0.5, dd = 0.3, path = "RVL", arr.side = 1,
             lcol = "lightblue", arr.type = "simple")  

segmentarrow(from = pos[3, ] + c(0.05, 0), to = pos[4, ] + c(-0.05, 0.01),
             arr.pos = 0.5, dd = 0.05, path = "RVL", lcol = "darkblue",
             arr.type = "ellipse")  

segmentarrow(from = pos[3, ] + c(0, -0.05), to = pos[4, ] + c(0, 0.05),
             arr.pos = 0.5, arr.side = 3, dd = 0.05, path = "DHU",
             lcol = "darkgreen")  

segmentarrow(from = pos[3,] + c(-0.05, -0.05), to = pos[4, ] + c(0, -0.05),
             arr.pos = 0.5, arr.side = 1:3, dd = 0.3, path = "DHU",
             lcol = "green")



