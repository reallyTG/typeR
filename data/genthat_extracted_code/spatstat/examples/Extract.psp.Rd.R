library(spatstat)


### Name: Extract.psp
### Title: Extract Subset of Line Segment Pattern
### Aliases: [.psp
### Keywords: spatial manip

### ** Examples

    a <- psp(runif(20),runif(20),runif(20),runif(20), window=owin())
    plot(a)
  # thinning
    id <- sample(c(TRUE, FALSE), 20, replace=TRUE)
    b <- a[id]
    plot(b, add=TRUE, lwd=3)
 # trimming
    plot(a)
    w <- owin(c(0.1,0.7), c(0.2, 0.8))
    b <- a[w]
    plot(b, add=TRUE, col="red", lwd=2)
    plot(w, add=TRUE)
    u <- a[w, fragments=FALSE]
    plot(u, add=TRUE, col="blue", lwd=3)



