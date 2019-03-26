library(cg)


### Name: descriptiveTable.cgPairedDifferenceData
### Title: Compute Descriptive Summary Statistics of Groups in a
###   cgPairedDifferenceData object
### Aliases: descriptiveTable.cgPairedDifferenceData
###   descriptiveTable,cgPairedDifferenceData-method
###   cgPairedDifferenceDescriptiveTable-class
###   cgPairedDifferenceDescriptiveTable

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)

descriptiveTable(anorexiaFT.data)

## Remove the geometric mean and standard error columns,
## and the Ratio / Percent Rows, since they are no longer applicable.

descriptiveTable(anorexiaFT.data, logscale=FALSE)





