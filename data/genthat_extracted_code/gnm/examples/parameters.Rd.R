library(gnm)


### Name: parameters
### Title: Extract Constrained and Estimated Parameters from a gnm Object
### Aliases: parameters
### Keywords: models

### ** Examples

RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
               MultHomog(origin, destination), family = poisson,
               data = occupationalStatus, ofInterest = "MultHomog",
               constrain = "MultHomog.*1")
coefficients(RChomog)
parameters(RChomog)



