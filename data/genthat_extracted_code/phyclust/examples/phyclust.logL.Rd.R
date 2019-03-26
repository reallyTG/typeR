library(phyclust)


### Name: phyclust.logL
### Title: Log-Likelihood of phyclust
### Aliases: phyclust.logL
### Keywords: phyclust stepwised

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D EMC.1 <- .EMC
##D EMC.1$EM.iter <- 1
##D # the same as EMC.1 <- .EMControl(EM.iter = 1)
##D X <- seq.data.toy$org
##D 
##D ret.1 <- phyclust(X, 2, EMC = EMC.1)
##D phyclust.logL(X, ret.phyclust = ret.1)
##D 
##D # For semi-supervised clustering.
##D semi.label <- rep(0, nrow(X))
##D semi.label[1:3] <- 1
##D phyclust.logL(X, ret.phyclust = ret.1, label = semi.label)
## End(Not run)



