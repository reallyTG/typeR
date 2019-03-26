library(cg)


### Name: prepareCGOneFactorData
### Title: Prepare data object from a data frame for One Factor / One-Way /
###   Unpaired Samples evaluations
### Aliases: prepareCGOneFactorData cgOneFactorData-class cgOneFactorData
### Keywords: datagen

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)




