library(ELYP)


### Name: fitYP41
### Title: Compute the Baseline Hazard for the Given Data, given Parameters
###   beta1, beta2.  Also, compute the empirical likelihood value.
### Aliases: fitYP41
### Keywords: nonparametric survival

### ** Examples

## find NPMLE of beta1 and beta2 in the simple YP model.
data(GastricCancer)
optim(par=c(1.5,-1.5), fn= myffitYP41, 
                       myY=GastricCancer[1,], 
					   myd=GastricCancer[2,], 
					   myZ=GastricCancer[4,])



