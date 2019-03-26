library(phyclust)


### Name: phyclust.update
### Title: Update phyclust Results
### Aliases: phyclust.update
### Keywords: phyclust

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D EMC.1 <- .EMC
##D EMC.1$EM.iter <- 1
##D # the same as EMC.1 <- .EMControl(EM.iter = 1)
##D X <- seq.data.toy$org
##D 
##D (ret.1 <- phyclust(X, 2, EMC = EMC.1))
##D (ret.2 <- phyclust.update(X, ret.phyclust = ret.1))
## End(Not run)



