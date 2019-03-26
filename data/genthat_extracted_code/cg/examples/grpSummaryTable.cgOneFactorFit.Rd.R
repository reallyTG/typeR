library(cg)


### Name: grpSummaryTable.cgOneFactorFit
### Title: Create a table of estimated group means and variability with a
###   cgOneFactorFit object.
### Aliases: grpSummaryTable.cgOneFactorFit cgOneFactorGrpSummaryTable
###   cgOneFactorGrpSummaryTable-class
###   grpSummaryTable,cgOneFactorFit-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

grpSummaryTable(canine.fit)

grpSummaryTable(canine.fit, mcadjust=TRUE, model="olsonly")


data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)

gmcsfcens.fit <- fit(gmcsfcens.data, type="aft")

grpSummaryTable(gmcsfcens.fit)




