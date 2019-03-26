library(PoisNonNor)


### Name: intercor.NNP
### Title: Computes the subset of the intermediate correlation matrix that
###   is pertinent to the count-continuous pairs
### Aliases: intercor.NNP

### ** Examples

## Not run: 
##D pmat = matrix(c(
##D    0.1148643, 1.0899150, -0.1148643, -0.0356926,
##D   -0.0488138, 0.9203374,  0.0488138,  0.0251256,
##D   -0.2107427, 1.0398224,  0.2107427, -0.0293247), nrow=3, byrow=TRUE)
##D 
##D lamvec = c(0.5,0.7,0.9)
##D 
##D cmat = matrix(c(
##D   0.342,  0.090, 0.141,
##D   0.297, -0.022, 0.177,
##D  0.294, -0.044, 0.129), nrow=3, byrow=TRUE)
##D 
##D intercor.NNP(lamvec, cmat, pmat)
## End(Not run)



