library(ripa)


### Name: imagematrix
### Title: Generate an imagematrix, i.e. primary data structure of rimage
### Aliases: imagematrix
### Keywords: misc

### ** Examples

  p <- q <- seq(-1, 1, length=20)
  r <- 1 - outer(p^2, q^2, "+") / 2
  plot(imagematrix(r))



