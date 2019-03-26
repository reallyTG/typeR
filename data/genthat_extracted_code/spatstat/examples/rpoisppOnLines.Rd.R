library(spatstat)


### Name: rpoisppOnLines
### Title: Generate Poisson Point Pattern on Line Segments
### Aliases: rpoisppOnLines
### Keywords: spatial datagen

### ** Examples

  live <- interactive()
  L <- psp(runif(10), runif(10), runif(10), runif(10),  window=owin())
  if(live) plot(L, main="")

  # uniform intensity
  Y <- rpoisppOnLines(4, L)
  if(live) plot(Y, add=TRUE, pch="+")

  # uniform MARKED process with types 'a' and 'b'
  Y <- rpoisppOnLines(c(a=4, b=5), L)
  if(live) {
    plot(L, main="")
    plot(Y, add=TRUE, pch="+")
  }

  # intensity is a function
  Y <- rpoisppOnLines(function(x,y){ 10 * x^2}, L, 10)
  if(live) { 
    plot(L, main="")
    plot(Y, add=TRUE, pch="+")
  }

  # intensity is an image
  Z <- as.im(function(x,y){10 * sqrt(x+y)}, unit.square())
  Y <- rpoisppOnLines(Z, L, 15)
  if(live) {
   plot(L, main="")
   plot(Y, add=TRUE, pch="+")
  }



