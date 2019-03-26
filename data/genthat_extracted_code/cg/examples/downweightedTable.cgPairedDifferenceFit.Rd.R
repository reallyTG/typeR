library(cg)


### Name: downweightedTable.cgPairedDifferenceFit
### Title: Create a table of downweighted observations from a Resistant &
###   Robust fit.
### Aliases: downweightedTable.cgPairedDifferenceFit
###   downweightedTable.cgPairedDifferenceFit
###   downweightedTable,cgPairedDifferenceFit-method
###   cgPairedDifferenceDownweightedTable-class
###   cgPairedDifferenceDownweightedTable

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

downweightedTable(anorexiaFT.fit, cutoffwt=0.25) ## No observation

downweightedTable(anorexiaFT.fit, cutoffwt=0.75) ## downweighted at least 25%
                                           



