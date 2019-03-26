library(SamplingStrata)


### Name: var.bin
### Title: Allows to transform a continuous variable into a categorical
###   ordinal one by applying a modified version of the k-means clustering
###   function in the 'stats' package.
### Aliases: var.bin
### Keywords: survey

### ** Examples

## No test: 
library(SamplingStrata)
data(swissmunicipalities)
data(swissframe)
swissframe$X1 <- var.bin(swissmunicipalities$POPTOT,bins = 18)
table(swissframe$X1)
tapply(swissmunicipalities$POPTOT,swissframe$X1,mean)
## End(No test)



