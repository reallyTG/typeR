library(npbr)


### Name: poly_degree
### Title: AIC and BIC criteria for choosing the optimal degree of the
###   polynomial frontier estimator
### Aliases: poly_degree
### Keywords: nonparametric optimize

### ** Examples

data("air")
x.air <- seq(min(air$xtab), max(air$xtab), 
 length.out = 101)
# Optimal polynomial degrees via the AIC criterion
(p.aic.air <- poly_degree(air$xtab, air$ytab, 
 type = "AIC"))
# Optimal polynomial degrees via the BIC criterion  
(p.bic.air <- poly_degree(air$xtab, air$ytab, 
 type = "BIC"))



