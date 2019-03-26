library(EMCluster)


### Name: Print and Summary
### Title: Functions for Printing or Summarizing Objects According to
###   Classes
### Aliases: print.emret summary.emret summary.svd
### Keywords: summary

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D x2 <- da2$da
##D 
##D emobj <- list(pi = da2$pi, Mu = da2$Mu, LTSigma = da2$LTSigma)
##D eobj <- e.step(x2, emobj = emobj)
##D emobj <- m.step(x2, emobj = eobj)
##D summary(emobj)
##D 
##D ret <- starts.via.svd(x2, nclass = 10, method = "kmeans")
##D summary(ret)
## End(Not run)



