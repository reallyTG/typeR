library(envlpaster)


### Name: scanner
### Title: scanner
### Aliases: scanner

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
##D scanner(M = avar, coef = beta, u = 1)
## End(Not run)



