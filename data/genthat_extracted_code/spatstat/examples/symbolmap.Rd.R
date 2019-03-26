library(spatstat)


### Name: symbolmap
### Title: Graphics Symbol Map
### Aliases: symbolmap
### Keywords: spatial hplot

### ** Examples

  g <- symbolmap(inputs=letters[1:10], pch=11:20)

  g1 <- symbolmap(range=c(0,100), size=function(x) x/50)

  g2 <- symbolmap(shape=function(x) ifelse(x > 0, "circles", "squares"),
                    size=function(x) sqrt(ifelse(x > 0, x/pi, -x)),
                    bg = function(x) ifelse(abs(x) < 1, "red", "black"))

  colmap <- colourmap(topo.colors(20), range=c(0,10))
  g3 <- symbolmap(pch=21, bg=colmap, range=c(0,10))
  plot(g3)



