library(phyclust)


### Name: phyclust.e.step
### Title: One E-Step of phyclust
### Aliases: phyclust.e.step
### Keywords: phyclust stepwised

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
##D ret.1 <- phyclust(X, 2, EMC = EMC.1)
##D ret.2 <- phyclust.e.step(X, ret.phyclust = ret.1)
##D str(ret.2)
##D 
##D # For semi-supervised clustering.
##D semi.label <- rep(0, nrow(X))
##D semi.label[1:3] <- 1
##D ret.3 <- phyclust.e.step(X, ret.phyclust = ret.1, label = semi.label)
## End(Not run)



