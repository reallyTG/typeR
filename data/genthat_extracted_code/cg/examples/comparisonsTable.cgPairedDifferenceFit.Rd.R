library(cg)


### Name: comparisonsTable.cgPairedDifferenceFit
### Title: Create a table of comparisons between two groups with the
###   cgPairedDifferenceFit object
### Aliases: comparisonsTable.cgPairedDifferenceFit
###   comparisonsTable,cgPairedDifferenceFit-method
###   cgPairedDifferenceComparisonsTable-class
###   cgPairedDifferenceComparisonsTable

### ** Examples

data(anorexiaFT)

## log scale
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1,
                                                 logscale=TRUE)
anorexiaFT.fit <- fit(anorexiaFT.data)


anorexiaFT.comps <- comparisonsTable(anorexiaFT.fit, display="none")
print(anorexiaFT.comps)

comparisonsTable(anorexiaFT.fit, model="olsonly") 
comparisonsTable(anorexiaFT.fit, model="rronly") 


## original scale evaluation
anorexiaFT.orig.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                      analysisname="Anorexia FT",
                                                      endptname="Weight",
                                                      endptunits="lbs",
                                                      expunitname="Patient",
                                                      digits=1,
                                                      logscale=FALSE)
anorexiaFT.orig.fit <- fit(anorexiaFT.orig.data)

comparisonsTable(anorexiaFT.orig.fit)  

comparisonsTable(anorexiaFT.orig.fit, addpct=TRUE)




