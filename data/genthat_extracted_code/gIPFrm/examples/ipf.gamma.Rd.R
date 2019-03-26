library(gIPFrm)


### Name: ipf.gamma
### Title: Iterative Proportional Fitting in Relational Models, with a
###   Given Adjustment Factor
### Aliases: ipf.gamma
### Keywords: Iterative Proportional Fitting

### ** Examples


## The model of independence for a 2 by 2 contingency table

A = matrix(c( 1,1,0,0,
              0,0,1,1,
              1,0,1,0,
              0,1,0,1), byrow=TRUE, nrow=4) ## the model matrix

y = c(1,2,3,4)  ## the observed data

ipf.gamma(A, y, 1, 1e-6, "intensities")   ## Adjustment factor is set to 1 

ipf.gamma(A, y, 0.5, 1e-6, "intensities")   ## Adjustment factor is set to 0.5 





