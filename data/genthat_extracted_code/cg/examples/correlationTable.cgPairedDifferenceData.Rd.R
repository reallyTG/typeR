library(cg)


### Name: correlationTable.cgPairedDifferenceData
### Title: Compute Correlations from a cgPairedDifferenceData object
### Aliases: correlationTable.cgPairedDifferenceData
###   correlationTable,cgPairedDifferenceData-method
###   cgPairedDifferenceCorrelationTable-class
###   cgPairedDifferenceCorrelationTable

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)

correlationTable(anorexiaFT.data)

## Show only correlations computed on original scale
correlationTable(anorexiaFT.data, logscale=FALSE)





