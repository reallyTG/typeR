library(cg)


### Name: comparisonsGraph.cgOneFactorComparisonsTable
### Title: Create an graph of the comparisons in a
###   cgOneFactorComparisonsTable object
### Aliases: comparisonsGraph.cgOneFactorComparisonsTable
###   comparisonsGraph,cgOneFactorComparisonsTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

## Comparisons Tables
canine.comps0 <- comparisonsTable(canine.fit)

canine.comps1 <- comparisonsTable(canine.fit,  mcadjust=TRUE,
                                   type="allgroupstocontrol", refgrp="CC")


## Comparisons Graphs
comparisonsGraph(canine.comps0)

comparisonsGraph(canine.comps1)

comparisonsGraph(canine.comps1, cex.comps=0.9,
                 ticklabels=list(mod="add", marks=c(300, 700)))



