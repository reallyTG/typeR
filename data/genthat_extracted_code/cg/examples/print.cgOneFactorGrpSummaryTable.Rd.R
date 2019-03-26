library(cg)


### Name: print.cgOneFactorGrpSummaryTable
### Title: Print One Factor Group Summary Table object with some format
###   options
### Aliases: print,cgOneFactorGrpSummaryTable-method
###   print.cgOneFactorGrpSummaryTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.grpsumm <- grpSummaryTable(canine.fit)

print(canine.grpsumm, digits=2)



