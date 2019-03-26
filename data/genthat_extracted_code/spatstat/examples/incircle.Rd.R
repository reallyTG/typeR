library(spatstat)


### Name: incircle
### Title: Find Largest Circle Inside Window
### Aliases: incircle inradius
### Keywords: spatial math

### ** Examples

  W <- square(1)
  Wc <- incircle(W)
  plot(W)
  plot(disc(Wc$r, c(Wc$x, Wc$y)), add=TRUE)

  plot(letterR)
  Rc <- incircle(letterR)
  plot(disc(Rc$r, c(Rc$x, Rc$y)), add=TRUE)

  W <- as.mask(letterR)
  plot(W)
  Rc <- incircle(W)
  plot(disc(Rc$r, c(Rc$x, Rc$y)), add=TRUE)



