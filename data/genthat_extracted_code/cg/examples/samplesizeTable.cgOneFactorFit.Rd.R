library(cg)


### Name: samplesizeTable.cgOneFactorFit
### Title: Estimate Sample Sizes based on a cgOneFactorFit object
### Aliases: samplesizeTable.cgOneFactorFit
###   samplesizeTable,cgOneFactorFit-method
###   cgOneFactorSampleSizeTable-class cgOneFactorSampleSizeTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.samplesize <- samplesizeTable(canine.fit, direction="increasing", 
                                     mmdvec=c(10, 25, 50, 75, 100))

samplesizeTable(canine.fit, direction="decreasing", 
                mmdvec=c(25, 50, 75), model="olsonly")



