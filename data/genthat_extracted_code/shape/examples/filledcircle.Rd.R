library(shape)


### Name: filledcircle
### Title: adds colored circle to a plot
### Aliases: filledcircle
### Keywords: aplot

### ** Examples

color <-graycol(n = 50)
dr    <- 0.05
emptyplot(xlim = c(-2, 2), col = color[length(color)], 
          main = "filledcircle")
filledcircle(r1 = 1, mid = c(1, 1), dr = dr, 
          col = shadepalette(endcol = "darkblue")) 
filledcircle(r1 = 1, mid = c(-1, -1), dr = dr, 
          col = shadepalette(endcol = "darkred"))
filledcircle(r1 = 1, r2 = 0.5, mid = c(0, 0), dr = dr, 
          col = c(rev(color), color))
filledcircle(r1 = 1, mid = c(1, -1), dr = dr, 
          col = intpalette(c("red", "blue", "orange"), 100)) 
filledcircle(mid = c(-1, 1))
  
emptyplot(main = "filledcircle")

for (i in seq(0, 0.45, 0.05)) 
   filledcircle(r1 = i+0.05, r2 = i, 
                mid = c(0.5, 0.5), col = i*20)



