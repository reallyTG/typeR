library(gnm)


### Name: exitInfo
### Title: Print Exit Information for gnm Fit
### Aliases: exitInfo
### Keywords: models regression nonlinear

### ** Examples


##  Fit a "double UNIDIFF" model with low iterMax for illustration!
set.seed(1)
doubleUnidiff <- gnm(Freq ~ election*vote + election*class*religion +
                     Mult(Exp(election), religion:vote) +
                     Mult(Exp(election), class:vote),
                     family = poisson, data = cautres, iterMax = 10)
exitInfo(doubleUnidiff)



