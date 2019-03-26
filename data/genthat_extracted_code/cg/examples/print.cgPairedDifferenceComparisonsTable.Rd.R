library(cg)


### Name: print.cgPairedDifferenceComparisonsTable
### Title: Print Paired Difference Comparisons Table object with some
###   format options
### Aliases: print.cgPairedDifferenceComparisonsTable
###   print,cgPairedDifferenceComparisonsTable-method

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

anorexiaFT.comps <- comparisonsTable(anorexiaFT.fit)

print(anorexiaFT.comps, digits=2)

print(anorexiaFT.comps, model="olsonly")




