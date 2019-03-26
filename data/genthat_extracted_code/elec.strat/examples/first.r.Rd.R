library(elec.strat)


### Name: first.r
### Title: Obtain a Vector of Sample Sizes with Total Number of Samples
###   Fixed
### Aliases: first.r next.r propSizes

### ** Examples

	data(MN_Senate_2006)
	MN_Senate_2006.strat$strat$audit <- first.r(MN_Senate_2006.strat, n = 150)
	BaB(MN_Senate_2006.strat)
	MN_Senate_2006.strat$strat$audit  <- next.r(MN_Senate_2006.strat, n = 150)
	BaB(MN_Senate_2006.strat)
	MN_Senate_2006.strat$strat$audit  <- propSizes(MN_Senate_2006.strat, n = 150)
	BaB(MN_Senate_2006.strat)



