library(cg)


### Name: print.cgPairedDifferenceDescriptiveTable
### Title: Print a Paired Difference Descriptive Table object with some
###   format options
### Aliases: print,cgPairedDifferenceDescriptiveTable-method
###   print.cgPairedDifferenceDescriptiveTable

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1,
                                                 logscale=TRUE)
## Next two calls are equivalent
descriptiveTable(anorexiaFT.data)

print(descriptiveTable(anorexiaFT.data, display="none"))

## A change in title
print(descriptiveTable(anorexiaFT.data, display="none"),
      title="Quantiles and Summary Statistics")




