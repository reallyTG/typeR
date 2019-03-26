library(seqinr)


### Name: circle
### Title: Draws a circle
### Aliases: circle

### ** Examples

par(mfrow = c(2, 2), mar = c(0,0,2,0))
setup <- function(){
  plot.new()
  plot.window(xlim = c(-1,1), ylim = c(-1,1), asp = 1)
}

setup()
circle(col = "lightblue")
title(main = "theta = c(0, 360)")

setup()
circle(col = "lightblue", theta = c(0, 270))
title(main = "theta = c(0, 270)")

setup()
circle(col = "lightblue", theta = c(-90, 180))
title(main = "theta = c(-90, 180)")

setup()
n <- 20
for(i in seq(0, 360, length = n)){
  circle(col = "lightblue", theta = c(i, i+360/(2*n)))
}
title(main = "many thetas")



