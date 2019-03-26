library(paleoTS)


### Name: IC
### Title: Compute information criterion scores and Akaike weights for
###   evoltuionary models
### Aliases: IC akaike.wts
### Keywords: models ts

### ** Examples

 x <- sim.GRW(ns=40, ms=0.1, vs=0.1)
 m1<- opt.GRW(x)	
 m2<- opt.URW(x)
 aw<- akaike.wts(c(m1$AICc, m2$AIC))  # easier to use compareModels(m1,m2)
	



