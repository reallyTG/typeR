library(cg)


### Name: kmGraph.cgOneFactorData
### Title: Graph Distribution Functions of Groups in a cgOneFactorData
###   object
### Aliases: kmGraph,cgOneFactorData-method kmGraph.cgOneFactorData

### ** Examples

data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
kmGraph(canine.data, distfcn="cumulative")
kmGraph(canine.data, distfcn="cumulative",
        ticklabels=list(mod="add", marks=c(2)))

## Censored Data
data(gmcsfcens)
gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE)
kmGraph(gmcsfcens.data, distfcn="cumulative")
kmGraph(gmcsfcens.data, distfcn="cumulative", logscale=FALSE)



