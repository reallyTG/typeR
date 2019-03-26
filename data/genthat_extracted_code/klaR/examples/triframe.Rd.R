library(klaR)


### Name: triframe
### Title: Barycentric plots
### Aliases: triframe
### Keywords: aplot

### ** Examples

triplot(grid = TRUE, frame = FALSE)     # plot without frame 
some.triangle <- rbind(c(0, 0.65, 0.35), c(0.53, 0.47, 0), 
                       c(0.72, 0, 0.28))[c(1:3, 1), ]
trilines(some.triangle, col = "red", pch = 16, type = "b")
triframe(label = c("left", "top", "right"), col = "blue", 
         label.col = "green3")          # frame on top of points 



