library(multiDimBio)


### Name: binomPower
### Title: Power analysis for estimating the heritability of a binomial
###   trait
### Aliases: binomPower

### ** Examples

	ndads <- c(9,18)
	mm <- 4.629634
	vv <- 6.31339
	tau2 <- c(0,0.5)
	nperms <- 2
	nsims <- 2
	nbins <- 3
	doPlot <- TRUE
	binomPower(ndads,mm,vv,tau2,nperms,nsims,nbins,doPlot)



