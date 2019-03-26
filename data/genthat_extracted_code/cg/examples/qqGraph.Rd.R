library(cg)


### Name: qqGraph
### Title: Quantile-Quantile Graphs
### Aliases: qqGraph

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

qqGraph(canine.fit)



