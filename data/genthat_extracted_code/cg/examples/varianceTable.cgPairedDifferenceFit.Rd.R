library(cg)


### Name: varianceTable.cgPairedDifferenceFit
### Title: Compute Variances from a cgPairedDifferenceFit object
### Aliases: varianceTable.cgPairedDifferenceFit
###   varianceTable,cgPairedDifferenceFit-method
###   cgPairedDifferenceVarianceTable-class cgPairedDifferenceVarianceTable

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
anorexiaFT.fit <- fit(anorexiaFT.data)

varianceTable(anorexiaFT.fit)




