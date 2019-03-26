library(spatstat)


### Name: plot.symbolmap
### Title: Plot a Graphics Symbol Map
### Aliases: plot.symbolmap
### Keywords: spatial hplot

### ** Examples

  g <- symbolmap(inputs=letters[1:10], pch=11:20)
  plot(g)

  g2 <- symbolmap(range=c(-1,1),
                    shape=function(x) ifelse(x > 0, "circles", "squares"),
                    size=function(x) sqrt(ifelse(x > 0, x/pi, -x)),
                    bg = function(x) ifelse(abs(x) < 1, "red", "black"))
  plot(g2, vertical=TRUE, side="left", col.axis="blue", cex.axis=2)



