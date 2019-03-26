library(infutil)


### Name: iota
### Title: Lindley Information (i.e., Information Utility) of Item Response
###   Patterns
### Aliases: iota
### Keywords: models

### ** Examples

ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)
Nu.lsat = nrow(unique(LSAT))
	
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat))
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=c("max.prior"))
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=0)
iota(ltm.lsat, data=LSAT, prior=Jeffreys(ltm.lsat), theta0=rnorm(Nu.lsat))
	



