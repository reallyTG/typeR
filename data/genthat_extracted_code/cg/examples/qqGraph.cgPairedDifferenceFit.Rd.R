library(cg)


### Name: qqGraph.cgPairedDifferenceFit
### Title: Quantile-Quantile (QQ) Graphs of a cgPairedDifferenceFit object
### Aliases: qqGraph,cgPairedDifferenceFit-method
###   qqGraph.cgPairedDifferenceFit

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

qqGraph(anorexiaFT.fit)

qqGraph(anorexiaFT.fit, model="olsonly")




