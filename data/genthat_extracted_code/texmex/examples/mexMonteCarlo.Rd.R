library(texmex)


### Name: mexMonteCarlo
### Title: Simulation from dependence models
### Aliases: mexMonteCarlo
### Keywords: models multivariate

### ** Examples

## No test: 
 
  mAll <- mexAll(winter,mqu=0.7,dqu=c(0.7,0.7,0.7,0.7,0.7))
  mexMC <- mexMonteCarlo(5000,mAll)
  pairs(mexMC$MCsample)
## End(No test)



