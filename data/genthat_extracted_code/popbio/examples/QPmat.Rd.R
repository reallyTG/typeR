library(popbio)


### Name: QPmat
### Title: Build a projection matrix from a time series of individuals (or
###   densities) per stage.
### Aliases: QPmat
### Keywords: survey

### ** Examples

## Not run: 
##D data(nematode)
##D ## list nonzero elements
##D nonzero <- c( 1, 2, 5, 6, 7, 9)
##D ## create C matrix
##D C <- rbind(diag(-1,6), c(1,1,0,0,0,0), c(0,0,1,1,0,0), c(0,0,0,0,0,1))
##D ## calculate b (transpose is not necessary - either way works)
##D b <- apply(C, 1, max)
##D QPmat(nematode, C,b,nonzero)
## End(Not run)



