library(MSnbase)


### Name: exprsToRatios-methods
### Title: Calculate all ratio pairs
### Aliases: exprsToRatios getRatios exprsToRatios-methods
###   exprsToRatios,MSnSet-method exprsToRatios,matrix-method
### Keywords: methods

### ** Examples

data(msnset)
pData(msnset)
head(exprs(msnset))
r <- exprsToRatios(msnset)
head(exprs(r))
pData(r)



