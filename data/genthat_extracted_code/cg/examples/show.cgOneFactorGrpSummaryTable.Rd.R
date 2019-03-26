library(cg)


### Name: show.cgOneFactorGrpSummaryTable
### Title: Show a One Factor Group Summary Table object from the cg package
### Aliases: show.cgOneFactorGrpSummaryTable
###   show,cgOneFactorGrpSummaryTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)
show(grpSummaryTable(canine.fit, display="none"))



