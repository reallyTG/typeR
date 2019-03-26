library(elec.strat)


### Name: strat.elec.data
### Title: Making a strat.elec.data Object from a Votes data.frame and an
###   Audit data.frame
### Aliases: strat.elec.data

### ** Examples

	data(MN_Senate_2006)
	votes <- MN_Senate_2006.strat$V
	audit <- MN_Senate_2006.strat$audit
	CID <- MN_Senate_2006.strat$V$CID
	names <- c("Klo","Ken")
	strat.elec.data(V = votes, C.names = names, audit = audit, CID = CID)



