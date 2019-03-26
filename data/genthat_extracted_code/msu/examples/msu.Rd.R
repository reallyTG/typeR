library(msu)


### Name: msu
### Title: Estimating Multivariate Symmetrical Uncertainty.
### Aliases: msu

### ** Examples

# completely predictable
msu(list(factor(c(0,0,1,1))), factor(c(0,0,1,1)))
# XOR
msu(list(factor(c(0,0,1,1)), factor(c(0,1,0,1))), factor(c(0,1,1,0)))
## Not run: 
##D msu(c(factor(c(0,0,1,1)), factor(c(0,1,0,1))), factor(c(0,1,1,0)))
##D msu(list(factor(c(0,0,1,1)), factor(c(0,1,0,1))), c(0,1,1,0))
## End(Not run)



