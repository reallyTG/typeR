library(cg)


### Name: prepareCGPairedDifferenceData
### Title: Prepare data object from a data frame for Paired Samples
###   evaluations
### Aliases: prepareCGPairedDifferenceData cgPairedDifferenceData-class
###   cgPairedDifferenceData
### Keywords: datagen

### ** Examples

data(anorexiaFT)
anorexiaFT.data <- prepareCGPairedDifferenceData(anorexiaFT, format="groupcolumns",
                                                 analysisname="Anorexia FT",
                                                 endptname="Weight",
                                                 endptunits="lbs",
                                                 expunitname="Patient",
                                                 digits=1, logscale=TRUE)



