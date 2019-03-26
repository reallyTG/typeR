library(Directional)


### Name: Mle of the Matrix Fisher distribution on SO(3)
### Title: Mle of the Matrix Fisher distribution on SO(3)
### Aliases: matrixfisher.mle
### Keywords: Matrix Fisher distribution Maximum likelihood estimation

### ** Examples

F <- 10^(-1) * matrix( c(85, 11, 41, 78, 39, 60, 43, 64, 48), ncol = 3 )   ### An arbitrary F matrix
X <- rmatrixfisher(5000, F)
matrixfisher.mle(X)
svd(F)



