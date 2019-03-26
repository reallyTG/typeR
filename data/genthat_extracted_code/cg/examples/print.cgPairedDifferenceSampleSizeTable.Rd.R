library(cg)


### Name: print.cgPairedDifferenceSampleSizeTable
### Title: Print a Paired Difference Sample Size Table object with some
###   format options
### Aliases: print,cgPairedDifferenceSampleSizeTable-method
###   print.cgPairedDifferenceSampleSizeTable

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

## The interest is in increased weight for the anorexia FT
## (family treatment) group of patients

anorexiaFT.samplesize <- samplesizeTable(anorexiaFT.fit, direction="increasing",
                         mmdvec=c(5, 10, 15, 20), display="none")

print(anorexiaFT.samplesize)

## The above two calls produce the same screen output as
samplesizeTable(anorexiaFT.fit, direction="increasing",
                mmdvec=c(5, 10, 15, 20))

## since the default in the call is display="print"




