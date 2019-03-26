library(varjmcm)


### Name: covjmcm_hpc
### Title: Calculate the estimation of the covariance of estimated
###   parameters in a HPC model, via the explicit formula.
### Aliases: covjmcm_hpc

### ** Examples

##This may take more than 5s.
## No test: 
cattleA <- cattle[cattle$group=='A', ]
fit.hpc <- jmcm(weight|id|I(ceiling(day/14+1))~1|1,
               data = cattleA, cov.method = "hpc",
               triple = c(8,3,4))
cov.hpc <- covjmcm_hpc(fit.hpc)
## End(No test)



