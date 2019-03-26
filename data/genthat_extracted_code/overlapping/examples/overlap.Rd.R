library(overlapping)


### Name: overlap
### Title: Overlapping estimation
### Aliases: overlap
### Keywords: utility

### ** Examples

set.seed(20150605)
x <- list(X1=rnorm(100), X2=rt(50,8), X3=rchisq(80,2))
out <- overlap(x, plot=TRUE)
out$OV

# including boundaries
x <- list(X1=runif(100), X2=runif(100,.5,1))
boundaries <- list( from = c(0,.5), to = c(1,1) )
out <- overlap(x, plot=TRUE, boundaries=boundaries)
out$OV

# equal boundaries
x <- list(X1=runif(100), X2=runif(50), X3=runif(30))
boundaries <- list( from = 0, to = 1 )
out <- overlap(x, plot=TRUE, boundaries=boundaries)
out$OV

# changing kernel
out <- overlap(x, plot=TRUE, kernel="rectangular")
out$OV



