library(spatstat)


### Name: text.ppp
### Title: Add Text Labels to Spatial Pattern
### Aliases: text.ppp text.lpp text.psp
### Keywords: spatial hplot

### ** Examples

  plot(cells)
  text(cells, pos=2)

  plot(Frame(cells))
  text(cells, cex=1.5)

  S <- as.psp(simplenet)
  plot(S)
  text(S)

  X <- runiflpp(5, simplenet)
  plot(X)
  text(X, pos=2, col="blue")



