library(cg)


### Name: errorBarGraph.cgOneFactorFit
### Title: Create an Error Bar graph amongst groups in a cgOneFactorFit
###   object
### Aliases: errorBarGraph,cgOneFactorFit-method
###   errorBarGraph.cgOneFactorFit

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

errorBarGraph(canine.fit)

errorBarGraph(canine.fit, mcadjust=TRUE, model="olsonly")



