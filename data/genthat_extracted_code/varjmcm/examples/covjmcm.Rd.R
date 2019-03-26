library(varjmcm)


### Name: covjmcm
### Title: Estimate the covariance of estimated parameters using the
###   explicit formula
### Aliases: covjmcm

### ** Examples

## balanced data
cattleA <- cattle[cattle$group=='A', ]
fit.mcd <- jmcm(weight|id|I(ceiling(day/14+1))~1|1,
               data = cattleA, cov.method = "mcd",
               triple = c(8,3,4))
cov.mcd <- covjmcm(fit.mcd)  ##same as covjmcm_mcd(fit.mcd)
## unbalanced data
## This may take about 1.25 min.
## No test: 
fit.hpc <- jmcm(I(sqrt(cd4)) | id | time ~ 1 | 1,
                data = aids, triple = c(8,1,1),
                cov.method = "hpc")
cov.hpc <- covjmcm(fit.hpc)  ##same as covjmcm_hpc(fit.hpc)
## End(No test)



