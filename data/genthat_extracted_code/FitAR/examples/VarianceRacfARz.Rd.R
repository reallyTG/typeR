library(FitAR)


### Name: VarianceRacfARz
### Title: Covariance Matrix Residual Autocorrelations for ARz
### Aliases: VarianceRacfARz
### Keywords: ts

### ** Examples

#the standard deviations of the first 5 residual autocorrelations
#to a subset AR(1,2,6) model fitted to Series A is
v<-VarianceRacfARp(c(0.36,0.23,0.23),c(1,2,6), 5, 197)
sqrt(diag(v))



