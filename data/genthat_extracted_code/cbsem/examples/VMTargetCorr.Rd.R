library(cbsem)


### Name: VMTargetCorr
### Title: 'VMTargetCorr' Given a target correlation matrix, R, and target
###   values of skewness and kurtosis for each marginal distribution, find
###   the "intermediate" correlation matrix, V
### Aliases: VMTargetCorr

### ** Examples

R <- matrix(c(1, 0.5, 0.3, 0.5 ,1, 0.2 , 0.3, 0.2 , 1),3,3)
coef <-  matrix(c( 0.90475830, 0.14721082, 0.02386092,0.78999781,0.57487681,
                            -0.05473674,0.79338100, 0.05859729, 0.06363759 ),3,3,byrow=TRUE) 
V <- VMTargetCorr(R, coef) 




