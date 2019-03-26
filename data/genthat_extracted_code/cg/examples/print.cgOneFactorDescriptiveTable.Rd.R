library(cg)


### Name: print.cgOneFactorDescriptiveTable
### Title: Print a One Factor Descriptive Table object with some format
###   options
### Aliases: print,cgOneFactorDescriptiveTable-method
###   print.cgOneFactorDescriptiveTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")

## Next two calls are equivalent
descriptiveTable(canine.data)

print(descriptiveTable(canine.data, display="none"))

print(descriptiveTable(canine.data, display="none"),
      title="Quantiles and Summary Statistics")

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)

## Next two calls are equivalent
descriptiveTable(gmcsfcens.data, display="print")
print(descriptiveTable(gmcsfcens.data, display="none"))





