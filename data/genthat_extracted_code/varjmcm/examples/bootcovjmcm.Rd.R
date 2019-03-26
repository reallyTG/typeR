library(varjmcm)


### Name: bootcovjmcm
### Title: Estimate the covariance of estimated parameters using a
###   bootstrap based method
### Aliases: bootcovjmcm

### ** Examples

cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight|id|I(ceiling(day/14+1))~1|1,
               data = cattleA,
               cov.method = "mcd",
               triple = c(1,1,1))
bootcovjmcm(fit.mcd, cattleA, 5)
## Larger number of replications is needed to achieve accuracy,
## however it may take hours.
## No test: 
bootcovjmcm(fit.mcd, cattleA, 500)
## End(No test)



