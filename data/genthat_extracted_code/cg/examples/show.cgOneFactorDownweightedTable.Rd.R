library(cg)


### Name: show.cgOneFactorDownweightedTable
### Title: Show a One Factor Downweighted Table object from the cg package
### Aliases: show.cgOneFactorDownweightedTable
###   show,cgOneFactorDownweightedTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
show(downweightedTable(canine.fit, cutoffwt=0.95, display="none"))



