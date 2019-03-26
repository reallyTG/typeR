library(geneSignatureFinder)


### Name: stNSCLC
### Title: Survival times of 147 samples affected by Non Small Cell Lung
###   Cancer disease.
### Aliases: stNSCLC
### Keywords: datasets

### ** Examples

data(stNSCLC)
library(survival)
plot(survfit(stNSCLC ~ 1))



