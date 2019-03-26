library(spatstat)


### Name: psp.object
### Title: Class of Line Segment Patterns
### Aliases: psp.object
### Keywords: spatial attribute

### ** Examples

# creating 
    a <- psp(runif(20),runif(20),runif(20),runif(20), window=owin())
# converting from other formats
    a <- as.psp(matrix(runif(80), ncol=4), window=owin())
    a <- as.psp(data.frame(x0=runif(20), y0=runif(20),
                            x1=runif(20), y1=runif(20)), window=owin())
# clipping
    w <- owin(c(0.1,0.7), c(0.2, 0.8))
    b <- clip.psp(a, w)
    b <- a[w]
# the last two lines are equivalent.



