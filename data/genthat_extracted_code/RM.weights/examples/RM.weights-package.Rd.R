library(RM.weights)


### Name: RM.weights-package
### Title: Rasch model and extensions for survey data, using Conditional
###   Maximum likelihood (CML).
### Aliases: RM.weights-package RM.weights-package
### Keywords: Conditional maximum likelihood, Rasch model, One-parameter
###   logistic model, Sampling weights, Equating, Probabilistic assignment

### ** Examples

## Not run: 
##D data(data.FAO_country1_2013)
##D # Questionnaire data and weights
##D XX = data.FAO_country1_2013[,1:8]
##D wt = data.FAO_country1_2013$wt
##D # Fit weighted Rasch
##D rr = RM.w(XX, wt)
##D pp = prob.assign(rr, sthres = seq(-5, 5, 0.01))
## End(Not run)



