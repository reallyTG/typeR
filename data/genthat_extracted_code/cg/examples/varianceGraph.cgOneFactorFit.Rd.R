library(cg)


### Name: varianceGraph.cgOneFactorFit
### Title: Equal Variance Graphs assessment of cgOneFactorFit object
### Aliases: varianceGraph,cgOneFactorFit-method
###   varianceGraph.cgOneFactorFit

### ** Examples

## From running examples of cgOneFactorData objects
data(canine)
canine.data <- prepareCGOneFactorData(canine, format="groupcolumns",
                                      analysisname="Canine",
                                      endptname="Prostate Volume",
                                      endptunits=expression(plain(cm)^3),
                                      digits=1, logscale=TRUE, refgrp="CC")
canine.fit <- fit(canine.data)

varianceGraph(canine.fit)

varianceGraph(canine.fit, model="olsonly")


gmcsfcens.data <- prepareCGOneFactorData(gmcsfcens, format="groupcolumns",
                                         analysisname="cytokine",
                                         endptname="GM-CSF (pg/ml)",
                                         logscale=TRUE,
                                         digits=1)

gmcsfcens.fit <- fit(gmcsfcens.data, type="aft")

varianceGraph(gmcsfcens.fit, trend=TRUE)

varianceGraph(gmcsfcens.fit) ## will yield a warning message why no line
                             ## is graphed

varianceGraph(gmcsfcens.fit, trend=FALSE)








