library(cg)


### Name: comparisonsGraph
### Title: Graph comparisons specified amongst groups
### Aliases: comparisonsGraph

### ** Examples

#### One Factor data

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.comps1 <- comparisonsTable(canine.fit,  mcadjust=TRUE,
                                  type="allgroupstocontrol", refgrp="CC")

comparisonsGraph(canine.comps1)






