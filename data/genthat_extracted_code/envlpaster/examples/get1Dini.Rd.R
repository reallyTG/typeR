library(envlpaster)


### Name: get1Dini
### Title: get1Dini
### Aliases: get1Dini

### ** Examples

## Not run: 
##D library(envlpaster)
##D data(simdata30nodes)
##D data <- simdata30nodes.asterdata
##D nnode <- length(vars)
##D xnew <- as.matrix(simdata30nodes[,c(1:nnode)])
##D m1 <- aster(xnew, root, pred, fam, modmat)
##D avar <- m1$fisher
##D beta <- m1$coef
##D U <- beta %o% beta
##D get1Dini(A = avar, B = U)
## End(Not run)



