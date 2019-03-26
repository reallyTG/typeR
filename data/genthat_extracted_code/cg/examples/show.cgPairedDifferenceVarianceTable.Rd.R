library(cg)


### Name: show.cgPairedDifferenceVarianceTable
### Title: Show a Paired Difference Variance Table object from the cg
###   package
### Aliases: show.cgPairedDifferenceVarianceTable
###   show,cgPairedDifferenceVarianceTable-method

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

## Next two calls are equivalent
varianceTable(anorexiaFT.fit, display="show")

show(varianceTable(anorexiaFT.fit, display="none"))





