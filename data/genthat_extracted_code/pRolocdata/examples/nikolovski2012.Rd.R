library(pRolocdata)


### Name: nikolovski2012
### Title: Meta-analysis from Nikolovski et al. (2012)
### Aliases: nikolovski2012 nikolovski2012imp
### Keywords: datasets

### ** Examples

data(nikolovski2012)
data(nikolovski2012imp)
table(is.na(nikolovski2012))
table(is.na(nikolovski2012imp))
phenoData(nikolovski2012)
table(fData(nikolovski2012)$markers)
all.equal(sort(featureNames(nikolovski2012)),
          sort(featureNames(nikolovski2012imp)))
library("pRoloc")
plot2D(nikolovski2012imp)
addLegend(nikolovski2012imp, where = "topright", bty = "n", cex =.7)



