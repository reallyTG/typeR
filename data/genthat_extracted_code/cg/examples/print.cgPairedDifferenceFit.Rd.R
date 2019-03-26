library(cg)


### Name: print.cgPairedDifferenceFit
### Title: Print One Factor Model Fit object with some format options
### Aliases: print,cgPairedDifferenceFit-method print.cgPairedDifferenceFit

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)
anorexiaFT.fit <- fit(data=anorexiaFT.data, type="rr")	

print(anorexiaFT.fit)



