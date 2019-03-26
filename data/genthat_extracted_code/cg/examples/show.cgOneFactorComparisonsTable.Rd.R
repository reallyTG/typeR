library(cg)


### Name: show.cgOneFactorComparisonsTable
### Title: Show a One Factor Comparisons Table object from the cg package
### Aliases: show.cgOneFactorComparisonsTable
###   show,cgOneFactorComparisonsTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
show(comparisonsTable(canine.fit, display="none"))



