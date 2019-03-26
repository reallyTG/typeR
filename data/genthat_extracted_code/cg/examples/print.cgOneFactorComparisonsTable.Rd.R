library(cg)


### Name: print.cgOneFactorComparisonsTable
### Title: Print One Factor Comparisons Table object with some format
###   options
### Aliases: print.cgOneFactorComparisonsTable
###   print,cgOneFactorComparisonsTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")

canine.fit <- fit(canine.data)

canine.comps0 <- comparisonsTable(canine.fit)

print(canine.comps0, digits=1)

canine.comps1 <- comparisonsTable(canine.fit,  mcadjust=TRUE,
                                  type="allgroupstocontrol", refgrp="CC")

print(canine.comps1, model="olsonly")




