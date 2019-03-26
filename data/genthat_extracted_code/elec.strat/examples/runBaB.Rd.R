library(elec.strat)


### Name: runBaB
### Title: Calling the Branch and Bound Algorithm
### Aliases: runBaB

### ** Examples

	data(MN_Senate_2006)
	M.u <- getEbsMargin(MN_Senate_2006.strat, t=2, asNumber = TRUE)
	u <- M.u$u
	M <- M.u$M
	q <- getQ(MN_Senate_2006.strat)
	CIDnum <- MN_Senate_2006.strat$V$CIDnum
	runBaB(u,q,M,CIDnum)



