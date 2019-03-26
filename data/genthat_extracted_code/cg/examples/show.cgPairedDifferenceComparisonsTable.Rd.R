library(cg)


### Name: show.cgPairedDifferenceComparisonsTable
### Title: Show a Paired Difference Data Comparisons Table object from the
###   cg package
### Aliases: show.cgPairedDifferenceComparisonsTable
###   show,cgPairedDifferenceComparisonsTable-method

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
show(comparisonsTable(anorexiaFT.fit, display="none"))



