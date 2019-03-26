library(phyclust)


### Name: phyclust.se.update
### Title: Update phyclust Results by the Sequencing Error Model
### Aliases: phyclust.se.update
### Keywords: phyclust

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D X <- seq.data.toy$org
##D 
##D (ret.1 <- find.best(X, 4))
##D (ret.2 <- phyclust.se.update(X, ret.phyclust = ret.1))
##D .EMC$se.constant <- 1e-3
##D (ret.3 <- phyclust.se.update(X, ret.phyclust = ret.2))
##D 
##D ### Search optimal error
##D func <- function(C){
##D   .EMC$se.constant <<- C
##D   -phyclust.se.update(X, ret.phyclust = ret.1)$logL
##D }
##D (ret.opt <- optimize(f = func, lower = 1e-3, upper = 1e-1))
##D .EMC$se.constant <- ret.opt$minimum
##D (ret.se.opt <- phyclust.se.update(X, ret.phyclust = ret.1))
## End(Not run)



