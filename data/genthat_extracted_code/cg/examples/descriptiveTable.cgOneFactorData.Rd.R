library(cg)


### Name: descriptiveTable.cgOneFactorData
### Title: Compute Descriptive Summary Statistics of Groups in a
###   cgOneFactorData object
### Aliases: descriptiveTable.cgOneFactorData
###   descriptiveTable,cgOneFactorData-method
###   cgOneFactorDescriptiveTable-class cgOneFactorDescriptiveTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")

descriptiveTable(canine.data)

## Remove the geometric mean and standard error columns
descriptiveTable(canine.data, logscale=FALSE)

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)
descriptiveTable(gmcsfcens.data)



