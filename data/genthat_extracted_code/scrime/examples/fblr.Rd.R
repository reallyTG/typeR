library(scrime)


### Name: fblr
### Title: Full Bayesian Logic Regression for SNP Data
### Aliases: fblr fblr.weight
### Keywords: regression nonlinear

### ** Examples
## Not run: 
##D # SNP dataset with 500 persons and 20 SNPs each,
##D # a two-SNP interaction influences the case probability
##D snp <- matrix(rbinom(500*20,2,0.3),ncol=20)
##D bin <- snp2bin(snp)
##D int <- apply(bin,1,function(x) (x[1] == 1 & x[3] == 0)*1)
##D case.prob <- exp(-0.5+log(5)*int)/(1+exp(-0.5+log(5)*int))
##D y <- rbinom(nrow(snp),1,prob=case.prob)
##D 
##D # normally more iterations should be used
##D fblr(y, bin, niter=1000, nburn=0)
##D analyse.models("fblr_mcmc.txt")
##D 
##D # Prior information: SNPs 1-10 belong to genes in one pathway, 
##D # SNPs 8-20 to another. Only interactions within a pathway are 
##D # considered and the first pathway is deemed to be twice as 
##D # important than the second.
##D fblr.weight(y,bin,niter=1000, nburn=0, group=list(1:20, 15:40), 
##D   weight=c(rep(2,20),rep(1,20)))
##D analyse.models("fblr_mcmc.txt")
##D 
## End(Not run)



