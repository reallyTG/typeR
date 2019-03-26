library(cg)


### Name: show.cgPairedDifferenceDescriptiveTable
### Title: Show a Paired Difference Descriptive Table object from the cg
###   package
### Aliases: show.cgPairedDifferenceDescriptiveTable
###   show,cgPairedDifferenceDescriptiveTable-method

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
descriptiveTable(anorexiaFT.data, display="show")

show(descriptiveTable(anorexiaFT.data, display="none"))





