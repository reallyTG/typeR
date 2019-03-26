library(rdrobust)


### Name: rdbwselect_2014
### Title: Deprecated Bandwidth Selection Procedures for Local-Polynomial
###   Regression-Discontinuity Estimators.
### Aliases: rdbwselect_2014 print.rdbwselect_2014 summary.rdbwselect_2014

### ** Examples

x<-runif(1000,-1,1)
y<-5+3*x+2*(x>=0)+rnorm(1000)
rdbwselect_2014(y,x)



