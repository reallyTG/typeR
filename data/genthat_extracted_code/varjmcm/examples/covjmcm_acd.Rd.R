library(varjmcm)


### Name: covjmcm_acd
### Title: Calculate the estimation of the covariance of estimated
###   parameters in a ACD model, via the explicit formula.
### Aliases: covjmcm_acd

### ** Examples

##This may take more than 5s.
## No test: 
cattleA <- cattle[cattle$group=='A', ]
fit.acd <- jmcm(weight|id|I(ceiling(day/14+1))~1|1,
               data = cattleA, cov.method = "acd",
               triple = c(8,3,4))
cov.acd <- covjmcm_acd(fit.acd)
## End(No test)



