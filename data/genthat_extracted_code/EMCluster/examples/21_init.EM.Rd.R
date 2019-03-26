library(EMCluster)


### Name: Initialization and EM
### Title: Initialization and EM Algorithm
### Aliases: init.EM em.EM rand.EM exhaust.EM
### Keywords: programming

### ** Examples

## Not run: 
##D library(EMCluster, quietly = TRUE)
##D set.seed(1234)
##D x <- da1$da
##D 
##D ret.em <- init.EM(x, nclass = 10, method = "em.EM")
##D ret.Rnd <- init.EM(x, nclass = 10, method = "Rnd.EM", EMC = .EMC.Rnd)
##D 
##D emobj <- simple.init(x, nclass = 10)
##D ret.init <- emcluster(x, emobj, assign.class = TRUE)
##D 
##D par(mfrow = c(2, 2))
##D plotem(ret.em, x)
##D plotem(ret.Rnd, x)
##D plotem(ret.init, x)
## End(Not run)



