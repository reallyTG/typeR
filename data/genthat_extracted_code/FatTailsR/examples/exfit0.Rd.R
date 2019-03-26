library(FatTailsR)


### Name: exfit0
### Title: Parameter Subsets
### Aliases: exfit0 exfit1 exfit2 exfit3 exfit4 exfit5 exfit6 exfit7
### Keywords: datasets

### ** Examples

    

require(minpack.lm)
require(timeSeries)

### Load the datasets and select one number j in 1:16
j      <- 5
DS     <- getDSdata()
(fitk  <- regkienerLX(DS[[j]])$fitk)
fitk[exfit3]
fitkienerX(DS[[j]], exfitk = exfit3)





