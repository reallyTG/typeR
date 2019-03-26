library(spatstat)


### Name: invoke.symbolmap
### Title: Plot Data Using Graphics Symbol Map
### Aliases: invoke.symbolmap
### Keywords: spatial hplot

### ** Examples

  g <- symbolmap(range=c(-1,1),
                   shape=function(x) ifelse(x > 0, "circles", "squares"),
                   size=function(x) sqrt(ifelse(x > 0, x/pi, -x))/15,
                   bg=function(x) ifelse(x > 0, "green", "red"))
  plot(square(1), main="")
  a <- invoke.symbolmap(g, runif(10, -1, 1), runifpoint(10), add=TRUE)
  a 



