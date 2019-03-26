library(cg)


### Name: show.cgPairedDifferenceDownweightedTable
### Title: Show a Paired Difference Downweighted Table object from the cg
###   package
### Aliases: show.cgPairedDifferenceDownweightedTable
###   show,cgPairedDifferenceDownweightedTable-method

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
show(downweightedTable(anorexiaFT.fit, cutoffwt=0.25, display="none"))



