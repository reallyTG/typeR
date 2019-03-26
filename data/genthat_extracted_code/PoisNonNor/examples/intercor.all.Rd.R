library(PoisNonNor)


### Name: intercor.all
### Title: Computes the intermediate correlation matrix
### Aliases: 'intercor.all '

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
##D   1.000,  0.352,  0.265, 0.342,  0.090, 0.141,
##D   0.352,  1.000,  0.121, 0.297, -0.022, 0.177,
##D   0.265,  0.121,  1.000, 0.294, -0.044, 0.129,
##D   0.342,  0.297,  0.294, 1.000,  0.100, 0.354,
##D   0.090, -0.022, -0.044, 0.100,  1.000, 0.386,
##D   0.141,  0.177,  0.129, 0.354,  0.386, 1.000), nrow=6, byrow=TRUE)
##D 
##D intercor.all(cmat,pmat,lamvec)
## End(Not run)



