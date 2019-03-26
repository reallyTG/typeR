library(spatstat)


### Name: nnfun
### Title: Nearest Neighbour Index Map as a Function
### Aliases: nnfun nnfun.ppp nnfun.psp
### Keywords: spatial math

### ** Examples

   f <- nnfun(cells)
   f
   plot(f)
   f(0.2, 0.3)

   g <- nnfun(cells, k=2)
   g(0.2, 0.3)

   L <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
   h <- nnfun(L)
   h(0.2, 0.3)



