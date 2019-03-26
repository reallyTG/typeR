library(cg)


### Name: fit.cgPairedDifferenceData
### Title: Fit models to a cgPairedDifferenceData object
### Aliases: fit.cgPairedDifferenceData fit,cgPairedDifferenceData-method
###   cgPairedDifferenceFit-class cgPairedDifferenceFit
### Keywords: models

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
anorexiaFT.fit <- fit(data=anorexiaFT.data, type="rr")					  




