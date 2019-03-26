library(spatstat)


### Name: distmap.psp
### Title: Distance Map of Line Segment Pattern
### Aliases: distmap.psp
### Keywords: spatial math

### ** Examples

    a <- psp(runif(20),runif(20),runif(20),runif(20), window=owin())
    Z <- distmap(a)
    plot(Z)
    plot(a, add=TRUE)



