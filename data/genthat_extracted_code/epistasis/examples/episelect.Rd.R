library(epistasis)


### Name: episelect
### Title: Model selection
### Aliases: episelect

### ** Examples

## Not run: 
##D #simulate data
##D D <- episim(p=50, n=100, k= 3, adjacent = 3, alpha = 0.06 , beta = 0.06)
##D plot(D)
##D 
##D #detect epistatic selection path
##D out  <-  epistasis(D$data, method="gibbs", n.rho= 5, ncores= 1)
##D 
##D #different graph selection methods
##D sel.ebic1 <- episelect(out, criteria="ebic")
##D plot(sel.ebic1)
##D 
##D sel.ebic2 <- episelect(out, criteria="ebic", loglik_Y=TRUE)
##D plot(sel.ebic2)
##D 
##D sel.aic <- episelect(out, criteria="aic")
##D plot(sel.aic)
##D 
##D sel.bic <- episelect(out, criteria="ebic", ebic.gamma = 0)
##D plot(sel.bic)
## End(Not run)



