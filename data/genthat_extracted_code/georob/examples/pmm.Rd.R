library(georob)


### Name: pmm
### Title: Parallelized Matrix Multiplication
### Aliases: pmm control.pcmp
### Keywords: models spatial robust

### ** Examples

## Not run: 
##D A <- as.matrix(dist(rnorm(2000)))
##D B <- as.matrix(dist(rnorm(2000)))
##D system.time(C <- pmm(A, B, control = control.pcmp(pmm.ncores = 1)))
##D system.time(C <- pmm(A, B, control = control.pcmp(pmm.ncores = 4)))
## End(Not run)


