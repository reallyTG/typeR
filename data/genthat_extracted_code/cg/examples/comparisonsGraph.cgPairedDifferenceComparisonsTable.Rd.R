library(cg)


### Name: comparisonsGraph.cgPairedDifferenceComparisonsTable
### Title: Create an graph of the comparisons in a
###   cgPairedDifferenceComparisonsTable object
### Aliases: comparisonsGraph.cgPairedDifferenceComparisonsTable
###   comparisonsGraph,cgPairedDifferenceComparisonsTable-method

### ** Examples


data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1,
                                                 logscale=TRUE)
anorexiaFT.fit <- fit(anorexiaFT.data)

anorexiaFT.comps0 <- comparisonsTable(anorexiaFT.fit)
anorexiaFT.comps1 <- comparisonsTable(anorexiaFT.fit,  model="olsonly", display="none")

comparisonsGraph(anorexiaFT.comps0)
comparisonsGraph(anorexiaFT.comps1)




