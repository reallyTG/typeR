library(shape)


### Name: filledcylinder
### Title: adds a colored and rotated cylinder to a plot
### Aliases: filledcylinder
### Keywords: aplot

### ** Examples

emptyplot(c(-1.2, 1.2), c(-1, 1), main = "filledcylinder")
col  <- c(rev(greycol(n = 50)), greycol(n = 50))
col2 <- shadepalette("red", "blue", n = 50)
col3 <- shadepalette("yellow", "black", n = 50)
filledcylinder(rx = 0., ry = 0.2, len = 0.25, angle = 0, col = col,  
          mid = c(-1, 0), topcol = col[25])          
filledcylinder(rx = 0., ry = 0.2, angle = 90, col = col, 
          mid = c(-0.5, 0), topcol = col[25])          
filledcylinder(rx = 0.1, ry = 0.2, angle = 90, col = c(col2, rev(col2)), 
          mid = c(0.45, 0), topcol = col2[25])          
filledcylinder(rx = 0.05, ry = 0.2, angle = 90, col = c(col3, rev(col3)), 
          mid = c(0.9, 0), topcol = col3[25])          
filledcylinder(rx = 0.1, ry = 0.2, angle = 90, col = "white",  
          lcol = "black", lcolint = "grey")          
  
emptyplot(c(-1, 1), c(-1, 1), main = "filledcylinder")
col  <- shadepalette("blue", "black", n = 50)
col2 <- shadepalette("red", "black", n = 50)
col3 <- shadepalette("yellow", "black", n = 50)
filledcylinder(rx = 0.025, ry = 0.2, angle = 90, col = c(col2, rev(col2)), 
          mid = c(-0.8, 0), topcol = col2[25], delt = -1, lcol = "black")
filledcylinder(rx = 0.1, ry = 0.2, angle = 00, col = c(col, rev(col)), 
          mid = c(0.0, 0.0), topcol = col, delt = -1.2, lcol = "black")
filledcylinder(rx = 0.075, ry = 0.2, angle = 90, col = c(col3, rev(col3)), 
          mid = c(0.8, 0), topcol = col3[25], delt = 0.0, lcol = "black")



