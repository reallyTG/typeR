library(cg)


### Name: samplesizeTable.cgPairedDifferenceFit
### Title: Estimate Sample Sizes based on a cgPairedDifferenceFit object
### Aliases: samplesizeTable.cgPairedDifferenceFit
###   samplesizeTable.cgPairedDifferenceFit
###   samplesizeTable,cgPairedDifferenceFit-method
###   cgPairedDifferenceSampleSizeTable-class
###   cgPairedDifferenceSampleSizeTable

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

## Recall the interest is in increased weight for the anorexia FT
## (family treatment) group of patients
samplesizeTable(anorexiaFT.fit, direction="increasing",
                mmdvec=c(5, 10, 15, 20))

## and with the adjustment on the noncentrality parameter
samplesizeTable(anorexiaFT.fit, direction="increasing",
                mmdvec=c(5, 10, 15, 20), correction="df")




