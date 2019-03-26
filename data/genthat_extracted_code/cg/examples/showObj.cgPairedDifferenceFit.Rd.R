library(cg)


### Name: showObj.cgPairedDifferenceFit
### Title: Show a Fitted Model object from the cg package
### Aliases: showObj.cgPairedDifferenceFit
###   showObj,cgPairedDifferenceFit-method

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
anorexiaFT.fit <- fit(data=anorexiaFT.data, type="rr")	

showObj(anorexiaFT.fit)

show(anorexiaFT.fit) ## alias for print method on the object 



