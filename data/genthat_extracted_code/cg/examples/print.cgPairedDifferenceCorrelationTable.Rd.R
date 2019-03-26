library(cg)


### Name: print.cgPairedDifferenceCorrelationTable
### Title: Print a Paired Difference Correlation Table object with some
###   format options
### Aliases: print,cgPairedDifferenceCorrelationTable-method
###   print.cgPairedDifferenceCorrelationTable

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
correlationTable(anorexiaFT.data)

print(correlationTable(anorexiaFT.data, display="none"))

## A change in title
print(correlationTable(anorexiaFT.data, display="none"),
      title="Correlations")




