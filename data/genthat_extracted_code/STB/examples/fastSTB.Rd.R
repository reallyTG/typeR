library(STB)


### Name: fastSTB
### Title: Simultaneous Tolerance Bands Using a Fast C-Implementation.
### Aliases: fastSTB

### ** Examples

## Not run: 
##D ### example for 10000 x 30 matrix
##D  set.seed(333)
##D  mat <- t(apply(matrix(rnorm(10000*30), ncol=30), 1, sort))
##D  stb.obj1 <- fastSTB(mat, timer=TRUE)
##D  stb.obj1$coverage
##D 	stb.obj2 <- fastSTB(mat, timer=TRUE, Ncpu=4)
##D  stb.obj3 <- fastSTB(mat, timer=TRUE, Ncpu=6)
##D  stb.obj4 <- fastSTB(mat, timer=TRUE, Ncpu=8)
## End(Not run)



