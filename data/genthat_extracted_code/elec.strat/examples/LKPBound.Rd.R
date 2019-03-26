library(elec.strat)


### Name: LKPBound
### Title: p-value Through a Continuous Relaxation
### Aliases: LKPBound

### ** Examples

	data(MN_Senate_2006)
	LKPBound(MN_Senate_2006.strat, takeOutZeroMMB = FALSE)
	LKPBound(MN_Senate_2006.strat, t = 2, asNumber = TRUE, 
		takeOutZeroMMB = FALSE, LKP.lower.bound = TRUE)
	
	data(CA_House_2008)	
	CA_House_2008.strat[[1]]$strat$audit <- 1
	LKPBound(CA_House_2008.strat[[1]], t = 0, LKP.lower.bound = TRUE)



