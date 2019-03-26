library(scrime)


### Name: predictFBLR
### Title: Predict Case Probabilities with Full Bayesian Logic Regression
### Aliases: predictFBLR
### Keywords: regression nonlinear

### ** Examples
## Not run: 
##D # Use fblr on some simulated SNP data
##D snp <- matrix(rbinom(500 * 20, 2, 0.3), ncol = 20)
##D bin <- snp2bin(snp)
##D int <- apply(bin,1,function(x) (x[1] == 1 & x[3] == 0)*1)
##D case.prob <- exp(-0.5+log(5)*int)/(1+exp(-0.5+log(5)*int))
##D y <- rbinom(nrow(snp),1,prob=case.prob)
##D fblr(y, bin, niter=1000, nburn=0)
##D 
##D # Prediction for some new observations 
##D newbin <- snp2bin(matrix(rbinom(100 * 20, 2, 0.3), ncol = 20))
##D predictFBLR("fblr_mcmc.txt",newbin)
##D 
## End(Not run)



