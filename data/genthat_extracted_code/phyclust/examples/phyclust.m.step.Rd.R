library(phyclust)


### Name: phyclust.m.step
### Title: One M-Step of phyclust
### Aliases: phyclust.m.step
### Keywords: phyclust stepwised

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D EMC.1 <- .EMC
##D EMC.1$short.iter <- 1
##D EMC.1$EM.iter <- 1
##D 
##D # Test with phyclust.
##D X <- seq.data.toy$org
##D ret.1 <- phyclust(X, 2, EMC = EMC.1)
##D 
##D # Test with an em step.
##D ret.em <- phyclust.em.step(X, ret.1)
##D 
##D # Test with an E- and M-step.
##D ret.1$Z.normalized <- phyclust.e.step(X, ret.phyclust = ret.1)
##D ret.m <- phyclust.m.step(X, ret.phyclust = ret.1)
##D 
##D # Test with 2 em steps.
##D set.seed(1234)
##D EMC.2 <- EMC.1
##D EMC.2$EM.iter <- 2
##D ret.2 <- phyclust(X, 2, EMC = EMC.2)
##D 
##D # Check logL.
##D phyclust.logL(X, ret.1)
##D phyclust.logL(X, ret.em)
##D phyclust.logL(X, ret.m)
##D phyclust.logL(X, ret.2)
##D 
##D # For semi-supervised.
##D semi.label <- rep(0, nrow(X))
##D semi.label[1:3] <- 1
##D ret.m.1 <- phyclust.m.step(X, ret.phyclust = ret.1, label = semi.label)
## End(Not run)



