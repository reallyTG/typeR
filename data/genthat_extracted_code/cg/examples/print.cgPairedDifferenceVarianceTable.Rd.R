library(cg)


### Name: print.cgPairedDifferenceVarianceTable
### Title: Print a Paired Difference Variance Table object with some format
###   options
### Aliases: print,cgPairedDifferenceVarianceTable-method
###   print.cgPairedDifferenceVarianceTable

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
varianceTable(anorexiaFT.fit)

print(varianceTable(anorexiaFT.fit, display="none"))

## A change in title
print(varianceTable(anorexiaFT.fit, display="none"),
      title="Estimated Variances")

## Show three digits in display 
print(varianceTable(anorexiaFT.fit), digits=3)




