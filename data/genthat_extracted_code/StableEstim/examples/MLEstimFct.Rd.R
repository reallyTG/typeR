library(StableEstim)


### Name: MLParametersEstim
### Title: Maximum likelihood (ML) method.
### Aliases: MLParametersEstim
### Keywords: Estim-functions

### ** Examples

theta <- c(1.5,0.4,1,0)
pm <- 0
## 50 points does not give accurate estimation
## but it makes estimation fast for installation purposes
## use at least 200 points to get decent results.
set.seed(1333);x <- rstable(50,theta[1],theta[2],theta[3],theta[4],pm)

## This example takes > 30 sec hence commented
##ML <- MLParametersEstim(x=x,pm=pm,PrintTime=TRUE)
## see the Examples folder for more examples.



