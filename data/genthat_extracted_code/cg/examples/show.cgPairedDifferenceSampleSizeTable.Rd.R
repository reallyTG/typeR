library(cg)


### Name: show.cgPairedDifferenceSampleSizeTable
### Title: Show a Paired Difference Sample Size Table object from the cg
###   package
### Aliases: show,cgPairedDifferenceSampleSizeTable-method
###   show.cgPairedDifferenceSampleSizeTable

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
show(samplesizeTable(anorexiaFT.fit, direction="increasing",
                     mmdvec=c(5, 10, 15, 20), display="none"))




