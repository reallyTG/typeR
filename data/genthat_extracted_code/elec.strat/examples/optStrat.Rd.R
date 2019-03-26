library(elec.strat)


### Name: optStrat
### Title: Obtain an Optimal Vector of Sample Sizes Given Constraint on
###   p-Value
### Aliases: optStrat

### ** Examples

	data(CA_House_2008)
	optStrat(CA_House_2008.strat[[3]], alpha = .1, t = .01, asTaint = TRUE)
	optStrat(CA_House_2008.strat[[3]], alpha = .1, t = .01,
		asTaint = TRUE, optBal = TRUE)



