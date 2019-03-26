library(sptemExp)


### Name: getTBasisFun
### Title: Generation of Temporal Basis Function
### Aliases: getTBasisFun
### Keywords: spatiotemporal modeling temporal basis function

### ** Examples

#Use PM2.5 as example:

data("shdSeries2014")
result=getTBasisFun(shdSeries2014,"siteid","date","obs",df=10,n.basis=2)



