library(PCRedux)


### Name: mblrr
### Title: A function to perform a Qunantile-filter based Local Robust
###   Regression
### Aliases: mblrr
### Keywords: regression segmented

### ** Examples


# Perform an mblrr analysis on noise (negative) amplification data of qPCR data
# with 35 cycles.
library(qpcR)
mblrr(x=boggy[, 1], y=boggy[, 2], normalize=TRUE)




