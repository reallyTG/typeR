library(nnfor)


### Name: linscale
### Title: Apply minmax linear scaling to a vector.
### Aliases: linscale

### ** Examples

  y <- rnorm(20)*100
  sc <- linscale(y)
  x <- sc$x
  print(c(min(y),max(y)))
  print(c(min(x),max(x)))
  sc.rev <- linscale(x,minmax=sc$minmax,rev=TRUE)
  print(c(min(sc.rev$x),max(sc.rev$x)))




