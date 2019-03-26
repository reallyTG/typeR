library(EMMIXcskew)


### Name: init.cfust
### Title: Initialization for Fitting Finite Mixtures of Canonical
###   Fundamental Skew t-Distributions
### Aliases: init.cfust init.fmcfust
### Keywords: EM algorithm multivariate skew t distribution maximum
###   likelihood estimation

### ** Examples


	#a short demo using geyser data
	library(MASS)
	data(geyser)
	initial.transformation <- init.cfust(3, geyser, method="transformation") 
	initial.transformation$loglik



