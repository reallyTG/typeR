library(HPbayes)


### Name: final.resamp
### Title: Final re-sampling step in Bayesian Melding using IMIS
### Aliases: final.resamp
### Keywords: misc

### ** Examples


## Not run: 
##D data(HPprior)
##D lx
##D dx
##D summary(q0)
##D age
##D 
##D 
##D opt.result <- loop.optim(prior = q0, nrisk=lx, ndeath=dx)
##D     opt.mu.d <- opt.result$opt.mu.d
##D     opt.cov.d <- opt.result$opt.cov.d
##D     theta.new <- opt.result$theta.new
##D     d.keep <- opt.result$d.keep
##D     log.like.0 <- opt.result$log.like.0
##D     wts.0 <- opt.result$wts.0
##D samp.po <- samp.postopt(opt.cov.d = opt.cov.d, opt.mu.d = opt.mu.d, 
##D         prior = q0, d.keep = d.keep)
##D     H.k <- samp.po$H.k
##D     H.new <- samp.po$H.new
##D     B1 <- samp.po$B1
##D ll.postopt <- like.resamp(K = 10, log.like.0 = log.like.0, 
##D         opt.cov.d = opt.cov.d, opt.mu.d = opt.mu.d, d.keep = d.keep)
##D     h.mu <- ll.postopt$h.mu
##D     h.sig <- ll.postopt$h.sig
##D     log.like <- ll.postopt$log.like
##D     K <- ll.postopt$K
##D result <- final.resamp(K = K, B1 = B1, H.new = H.new, H.k = H.k, 
##D         log.like = log.like, d.keep = d.keep, prior = q0, 
##D         h.mu = h.mu, h.sig = h.sig, nrisk=lx, ndeath=dx, age=age)
##D         
## End(Not run)




