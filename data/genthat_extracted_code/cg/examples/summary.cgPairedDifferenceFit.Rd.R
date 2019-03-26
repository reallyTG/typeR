library(cg)


### Name: summary.cgPairedDifferenceFit
### Title: Summary display of a Paired Difference Model Fit object with
###   some format options
### Aliases: summary,cgPairedDifferenceFit-method
###   summary.cgPairedDifferenceFit

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
anorexiaFT.fit <- fit(anorexiaFT.data)

summary(anorexiaFT.fit)



