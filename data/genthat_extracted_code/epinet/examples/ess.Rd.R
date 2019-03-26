library(epinet)


### Name: ess
### Title: Calculate the Effective Sample Size
### Aliases: ess
### Keywords: effective sample size, lag autocorrelation

### ** Examples

	set.seed(8)
	x <- runif(1000)
	# expect ESS of close to 900 as samples are iid
	ess(x, ignoreBurnin = TRUE)
	# no burnin to ignore so ess is actually close to 1000
	ess(x, ignoreBurnin = FALSE)
	
	# ESS is a rough measure at best
	ess(1:1000,ignoreBurnin = FALSE)	



