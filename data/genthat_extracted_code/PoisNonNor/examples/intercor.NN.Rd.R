library(PoisNonNor)


### Name: intercor.NN
### Title: Computes the subset of the intermediate correlation matrix that
###   is pertinent to the continuous pairs
### Aliases: intercor.NN

### ** Examples

## Not run: 
##D pmat = matrix(c(
##D   0.1148643, 1.0899150, -0.1148643, -0.0356926,
##D   -0.0488138, 0.9203374,  0.0488138,  0.0251256,
##D   -0.2107427, 1.0398224,  0.2107427, -0.0293247), nrow=3, byrow=TRUE)
##D cmat = matrix(c(
##D   1.000,  0.100, 0.354,
##D   0.100,  1.000, 0.386,
##D   0.354,  0.386, 1.000),nrow=3,byrow=TRUE)
##D 
##D intercor.NN(pmat,cmat)
## End(Not run)



