library(cg)


### Name: boxplot.cgOneFactorData
### Title: Box Plot Graph of Groups from a cgOneFactorData object
### Aliases: boxplot,cgOneFactorData-method boxplot.cgOneFactorData

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
boxplot(canine.data)

## Plot the data on the original scale instead of the log scale
boxplot(canine.data, logscale=FALSE)

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)
boxplot(gmcsfcens.data)



