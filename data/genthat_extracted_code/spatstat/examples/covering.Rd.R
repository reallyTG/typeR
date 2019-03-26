library(spatstat)


### Name: covering
### Title: Cover Region with Discs
### Aliases: covering
### Keywords: spatial math

### ** Examples

  rr <- 0.5
  X <- covering(letterR, rr)
  plot(grow.rectangle(Frame(X), rr), type="n", main="")
  plot(X, pch=16, add=TRUE, col="red")
  plot(letterR, add=TRUE, lwd=3)
  plot(X %mark% (2*rr), add=TRUE, markscale=1)



