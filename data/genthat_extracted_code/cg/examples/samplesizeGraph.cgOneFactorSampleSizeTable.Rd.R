library(cg)


### Name: samplesizeGraph.cgOneFactorSampleSizeTable
### Title: Graph estimated sample sizes from a cgOneFactorSampleSizeTable
###   object
### Aliases: samplesizeGraph,cgOneFactorSampleSizeTable-method
###   samplesizeGraph.cgOneFactorSampleSizeTable

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

canine.samplesize <- samplesizeTable(canine.fit, direction="increasing", 
                                     mmdvec=c(10, 25, 50, 75, 100)) ## print method shows table

samplesizeGraph(canine.samplesize)

samplesizeGraph(canine.samplesize, model="olsonly",
                mmdticklabels=list(mod="add", marks=100))



