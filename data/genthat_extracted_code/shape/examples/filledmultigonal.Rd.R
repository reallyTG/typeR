library(shape)


### Name: filledmultigonal
### Title: adds a colored and rotated multigonal shape to a plot
### Aliases: filledmultigonal
### Keywords: aplot

### ** Examples

emptyplot(c(-1, 1), main = "filledmultigonal")

filledmultigonal(rx = 0.25, ry = 0.125, nr = 3, mid = c(-0.75, 0.75), 
            angle = 45, col = shadepalette("red", "blue", n = 50))
filledmultigonal(rx = 0.125, ry = 0.25, nr = 3, mid = c(-0.25, 0.75), 
            col = shadepalette("red", "yellow", n = 50))
filledmultigonal(rx = 0.25, ry = 0.25 , nr = 3, mid = c(0.25, 0.75),  
            col = c("red", "orange"))
filledmultigonal(rx = 0.25, ry = 0.25 , nr = 3, mid = c(0.75, 0.75), 
            angle = 90,  col = "red")
 
filledmultigonal(rx = 0.25, ry = 0.25, nr = 4, mid = c(-0.75, 0.25), 
            angle = 0, col = shadepalette("red", "blue", n = 50))
filledmultigonal(rx = 0.25, ry = 0.25, nr = 4, mid = c(-0.25, 0.25),  
            angle = 45, col = shadepalette("red", "blue", n = 50))
filledmultigonal(rx = 0.25, ry = 0.125, nr = 4, mid = c(0.25, 0.25), 
            angle = 0, col = shadepalette("red", "blue", n = 50))
filledmultigonal(rx = 0.25, ry = 0.125, nr = 4, mid = c(0.75, 0.25), 
            angle = 45, col = shadepalette("red", "blue", n = 50))
  
filledmultigonal(rx = 0.25, ry = 0.25, nr = 5, mid = c(-0.75, -0.25),  
            angle = 0, col = shadepalette("darkgreen", "lightgreen", n = 50))
filledmultigonal(rx = 0.25, angle = 0, nr = 5, mid = c(-0.25, -0.25), 
            col = rainbow(50))
filledmultigonal(rx = 0.25, angle = 30, nr = 6, mid = c(0.25, -0.25), 
            col = femmecol(50))
filledmultigonal(rx = 0.25, ry = 0.125, angle = 30, nr = 6, mid = c(0.75, -0.25), 
            col = "black")
  
filledmultigonal(rx = 0.25, col = "darkblue", nr = 7, mid = c(-0.75, -0.75))
filledmultigonal(rx = 0.25, col = "darkblue", nr = 9, mid = c(-0.25, -0.75))
filledmultigonal(rx = 0.25, col = "darkblue", nr = 3.7, mid = c(0.25, -0.75))
filledmultigonal(rx = 0.25, col = "darkblue", nr = 4.5, mid = c(0.75, -0.75))



