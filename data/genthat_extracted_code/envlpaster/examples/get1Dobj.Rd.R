library(envlpaster)


### Name: get1Dobj
### Title: get1Dobj
### Aliases: get1Dobj

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
##D get1Dobj(w = beta, A = avar, B = U)
## End(Not run)



