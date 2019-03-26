library(msu)


### Name: symmetrical_uncertainty
### Title: Estimating Symmetrical Uncertainty of two categorical variables.
### Aliases: symmetrical_uncertainty symmetrical_uncertainty SU

### ** Examples

# completely predictable
symmetrical_uncertainty(factor(c(0,1,0,1)), factor(c(0,1,0,1)))
# XOR factor variables
symmetrical_uncertainty(factor(c(0,0,1,1)), factor(c(0,1,1,0)))
symmetrical_uncertainty(factor(c(0,1,0,1)), factor(c(0,1,1,0)))
## Not run: 
##D symmetrical_uncertainty(c(0,1,0,1), c(0,1,1,0))
## End(Not run)



