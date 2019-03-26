library(CovTools)


### Name: DiagTest1.2015Lan
### Title: One-Sample Diagonality Test by Lan et al. (2015)
### Aliases: DiagTest1.2015Lan

### ** Examples

## Not run: 
##D ## generate data from multivariate normal with trivial covariance.
##D data = matrix(rnorm(100*5), nrow=100)
##D 
##D ## run test with different alpha values
##D DiagTest1.2015Lan(data, alpha=0.01)
##D DiagTest1.2015Lan(data, alpha=0.05)
##D DiagTest1.2015Lan(data, alpha=0.10)
## End(Not run)




