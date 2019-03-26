library(cg)


### Name: downweightedTable.cgOneFactorFit
### Title: Create a table of downweighted observations from a Resistant &
###   Robust fit.
### Aliases: downweightedTable.cgOneFactorFit
###   downweightedTable,cgOneFactorFit-method
###   cgOneFactorDownweightedTable-class cgOneFactorDownweightedTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.dwtable <- downweightedTable(canine.fit, cutoff=0.95)

downweightedTable(canine.fit, cutoff=0.75) ## No observation
                                           ## downweighted at least 25%




