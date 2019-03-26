library(elec.strat)


### Name: get.first.r.samp
### Title: Obtain a Vector of Sample Sizes Given Constraint on p-Value
### Aliases: get.first.r.samp get.next.r.samp get.prop.samp

### ** Examples

	data(CA_House_2008)
	get.first.r.samp(CA_House_2008.strat[[3]], alpha = .1, t = .01, asTaint = TRUE)
	get.next.r.samp(CA_House_2008.strat[[3]], alpha = .1, t = .01, asTaint = TRUE)
	get.prop.samp(CA_House_2008.strat[[3]], alpha = .1, t = .01, asTaint = TRUE)



