library(elec.strat)


### Name: makeStratObj
### Title: Making a strat.elec.data Object from an elec.data Object
### Aliases: makeStratObj

### ** Examples

	data("CA_House_2008")
	dstrat <- CA_House_2008.strat[[1]]
	auditTable <- cbind(unique(dstrat$V$CID),1)
	dstrat <- makeStratObj(dstrat,auditTable = auditTable)



