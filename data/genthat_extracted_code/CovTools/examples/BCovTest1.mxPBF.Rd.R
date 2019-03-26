library(CovTools)


### Name: BCovTest1.mxPBF
### Title: One-Sample Covariance Test using Maximum Pairwise Bayes Factor
### Aliases: BCovTest1.mxPBF

### ** Examples

## Not run: 
##D ## generate data from multivariate normal with trivial covariance.
##D data = matrix(rnorm(100*5), nrow=100)
##D 
##D ## run mxPBF-based test
##D out1 = BCovTest1.mxPBF(data)
##D out2 = BCovTest1.mxPBF(data, a0=5.0, b0=5.0) # change some params
##D 
##D ## visualize two Bayes Factor matrices
##D par(mfrow=c(1,2), pty="s")
##D image(exp(out1$log.BF.mat)[,5:1], main="default")
##D image(exp(out2$log.BF.mat)[,5:1], main="a0=b0=5.0")
## End(Not run)




