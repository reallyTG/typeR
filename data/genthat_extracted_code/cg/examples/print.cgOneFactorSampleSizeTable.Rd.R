library(cg)


### Name: print.cgOneFactorSampleSizeTable
### Title: Print a One Factor Sample Size Table object with some format
###   options
### Aliases: print,cgOneFactorSampleSizeTable-method
###   print.cgOneFactorSampleSizeTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.samplesize <- samplesizeTable(canine.fit, direction="increasing",
                                     model="olsonly",
                                     mmdvec=c(10, 25, 50, 75, 100), display="none")
print(canine.samplesize)



