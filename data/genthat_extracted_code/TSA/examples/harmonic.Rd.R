library(TSA)


### Name: harmonic
### Title: Construct harmonic functions for fitting harmonic trend model
### Aliases: harmonic
### Keywords: methods

### ** Examples

data(tempdub)
# first creates the first pair of harmonic functions and then fit the model
har.=harmonic(tempdub,1)
model4=lm(tempdub~har.)
summary(model4)



