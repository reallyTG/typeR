library(cg)


### Name: samplesizeGraph.cgPairedDifferenceSampleSizeTable
### Title: Graph estimated sample sizes from a
###   cgPairedDifferenceSampleSizeTable object
### Aliases: samplesizeGraph,cgPairedDifferenceSampleSizeTable-method
###   samplesizeGraph.cgPairedDifferenceSampleSizeTable

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
                         mmdvec=c(5, 10, 15, 20)) ## print method shows table

samplesizeGraph(anorexiaFT.samplesize)

samplesizeGraph(anorexiaFT.samplesize, nticklabels=list(mod="add", marks=3))



