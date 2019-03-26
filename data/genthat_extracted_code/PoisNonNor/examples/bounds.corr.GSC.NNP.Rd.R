library(PoisNonNor)


### Name: bounds.corr.GSC.NNP
### Title: Computes the approximate lower and upper bounds of the
###   correlation matrix entries for the continuous-count pairs
### Aliases: bounds.corr.GSC.NNP

### ** Examples

## Not run: 
##D pmat = matrix(c(
##D    0.1148643, 1.0899150, -0.1148643, -0.0356926,
##D   -0.0488138, 0.9203374,  0.0488138,  0.0251256,
##D   -0.2107427, 1.0398224,  0.2107427, -0.0293247), nrow=3, byrow=TRUE)
##D 
##D lamvec = c(0.5,0.7,0.9)
##D 
##D bounds.corr.GSC.NNP(lamvec,pmat) 
## End(Not run)



