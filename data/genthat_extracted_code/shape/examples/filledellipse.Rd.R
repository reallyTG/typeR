library(shape)


### Name: filledellipse
### Title: adds a colored and rotated ellipse to a plot
### Aliases: filledellipse
### Keywords: aplot

### ** Examples

color <- greycol(50)
dr    <- 0.05
emptyplot(xlim = c(-2, 2), ylim = c(-2, 2), col = color[length(color)], 
          main = "filledellipse")
filledellipse(rx1 = 1, mid = c(1, 1) , dr = dr, 
              col = shadepalette(endcol = "darkblue")) 
filledellipse(rx1 = 1, ry1 = 0.5, mid = c(-1, -1), dr = dr, angle = 90, 
              col = shadepalette(endcol = "darkred"))
filledellipse(rx1 = 1, ry1 = 0.5, rx2 = 0.5, dr = dr, mid = c(0, 0), 
              col = c(rev(color), color))
filledellipse(rx1 = 0.5, mid = c(1, -1), dr = dr, from = pi,  to = 1.5*pi, 
              col = rev(shadepalette(endcol = "black"))) 
filledellipse(mid = c(-1, 1))  
  
emptyplot(xlim = c(-2, 2), ylim = c(-2, 2), main = "filledellipse")
filledellipse(rx1 = 0.75, mid = c(-1, 1), col = greycol(100) , dr = dr,  
              values = cbind (1:100, (1:100)^0.5))
filledellipse(rx1 = 0.75, mid = c(1, 1), col = greycol(100)  , dr = dr,  
              values = cbind (1:100, (1:100)))
filledellipse(rx1 = 0.75, mid = c(-1, -1), col = greycol(100), dr = dr,  
              values = cbind (1:100, (1:100)^2))
filledellipse(rx1 = 0.75, mid = c(1, -1), col = greycol(100) , dr = dr,  
              values = cbind (1:100, (1:100)^5))



