library(varjmcm)


### Name: covjmcm_mcd
### Title: Calculate the estimation of the covariance of estimated
###   parameters in a MCD model, via the explicit formula.
### Aliases: covjmcm_mcd

### ** Examples

cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight|id|I(ceiling(day/14+1))~1|1,
               data = cattleA, cov.method = "mcd",
               triple = c(8,3,4))
cov.mcd <- covjmcm_mcd(fit.mcd)



