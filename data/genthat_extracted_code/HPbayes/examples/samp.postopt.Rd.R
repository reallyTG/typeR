library(HPbayes)


### Name: samp.postopt
### Title: Multivariate Gaussian Sampling for Heligman-Pollard model
###   estimated via Bayesian Melding
### Aliases: samp.postopt
### Keywords: misc

### ** Examples

## Not run: 
##D data(HPprior)
##D q0 <- HPprior
##D lx <- c(1974, 1906, 1860, 1844, 1834, 1823, 1793, 1700, 1549, 1361, 
##D 1181, 1025, 870, 721, 571, 450, 344, 256, 142, 79, 41, 8)
##D dx <- c(68, 47, 16, 10, 13, 29, 92, 151, 188, 179, 156, 155, 147, 150, 
##D 122, 106, 88, 113, 63, 38, 32, 8)
##D opt.result <- loop.optim(prior = q0, nrisk=lx, ndeath=dx)
##D     opt.mu.d <- opt.result$opt.mu.d
##D     opt.cov.d <- opt.result$opt.cov.d
##D     theta.new <- opt.result$theta.new
##D     d.keep <- opt.result$d.keep
##D     log.like.0 <- opt.result$log.like.0
##D     wts.0 <- opt.result$log.like.0
##D samp.po <- samp.postopt(opt.cov.d = opt.cov.d, opt.mu.d = opt.mu.d, 
##D         prior = q0, d.keep = d.keep)
## End(Not run)



