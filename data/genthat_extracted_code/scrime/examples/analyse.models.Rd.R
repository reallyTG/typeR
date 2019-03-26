library(scrime)


### Name: analyse.models
### Title: Summarize MCMC sample of Bayesian logic regression models
### Aliases: analyse.models
### Keywords: regression nonlinear

### ** Examples
## Not run: 
##D # Use fblr on some simulated SNP data
##D snp <- matrix(rbinom(500*20,2,0.3),ncol=20)
##D bin <- snp2bin(snp)
##D int <- apply(bin,1,function(x) (x[1] == 1 & x[3] == 0)*1)
##D case.prob <- exp(-0.5+log(5)*int)/(1+exp(-0.5+log(5)*int))
##D y <- rbinom(nrow(snp),1,prob=case.prob)
##D fblr(y, bin, niter=1000, nburn=0)
##D 
##D analyse.models("fblr_mcmc.txt")
##D 
##D # with SNP names
##D name.snp <- LETTERS[1:20]
##D name.bin <- paste(rep(name.snp,each=2), c("_d","_r"),sep="")
##D 
##D analyse.models("fblr_mcmc.txt", bin.names=name.bin)
##D   
## End(Not run)



