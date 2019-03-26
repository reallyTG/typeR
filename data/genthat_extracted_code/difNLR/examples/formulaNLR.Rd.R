library(difNLR)


### Name: formulaNLR
### Title: Formula for Non-Linear Regression DIF model.
### Aliases: formulaNLR

### ** Examples

## Not run: 
##D # 3PL model with the same guessing for both groups
##D # to test both types of DIF
##D formulaNLR(model = "3PLcg", type = "both")
##D 
##D # 4PL model with the same guessing and inattention
##D # to test uniform DIF
##D formulaNLR(model = "4PLcgdg", type = "udif")
##D 
##D # 2PL model to test non-uniform DIF
##D formulaNLR(model = "2PL", type = "nudif")
##D 
##D # 4PL model to test all possible DIF
##D # with alternative parameterization
##D formulaNLR(model = "4PL", type = "all", parameterization = "alternative")
##D 
##D # 4PL model with fixed a and c parameter
##D # to test difference in b with alternative parameterization
##D formulaNLR(model = "4PL", constraints = "ac", type = "b", parameterization = "alternative")
## End(Not run)




