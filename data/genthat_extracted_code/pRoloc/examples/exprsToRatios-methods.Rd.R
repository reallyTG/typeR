library(pRoloc)


### Name: exprsToRatios-methods
### Title: Calculate all ratio pairs
### Aliases: exprsToRatios exprsToRatios-methods
###   exprsToRatios,MSnSet-method
### Keywords: methods

### ** Examples

library("pRolocdata")
data(dunkley2006)
x <- dunkley2006[, 1:3]
head(exprs(x))
r <- exprsToRatios(x)
head(exprs(r))
pData(r)



