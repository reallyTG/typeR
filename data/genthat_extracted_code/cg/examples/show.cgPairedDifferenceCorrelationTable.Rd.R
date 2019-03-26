library(cg)


### Name: show.cgPairedDifferenceCorrelationTable
### Title: Show a Paired Difference Correlation Table object from the cg
###   package
### Aliases: show.cgPairedDifferenceCorrelationTable
###   show,cgPairedDifferenceCorrelationTable-method

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
correlationTable(anorexiaFT.data, display="show")

show(correlationTable(anorexiaFT.data, display="none"))





