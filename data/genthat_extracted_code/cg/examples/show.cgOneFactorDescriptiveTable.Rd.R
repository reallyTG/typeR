library(cg)


### Name: show.cgOneFactorDescriptiveTable
### Title: Show a One Factor Descriptive Table object from the cg package
### Aliases: show.cgOneFactorDescriptiveTable
###   show,cgOneFactorDescriptiveTable-method

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
show(descriptiveTable(canine.data, display="none"))

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)
show(descriptiveTable(gmcsfcens.data, display="none"))



