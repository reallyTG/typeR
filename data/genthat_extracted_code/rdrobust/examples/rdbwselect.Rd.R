library(rdrobust)


### Name: rdbwselect
### Title: Bandwidth Selection Procedures for Local Polynomial Regression
###   Discontinuity Estimators
### Aliases: rdbwselect print.rdbwselect summary.rdbwselect

### ** Examples

x<-runif(1000,-1,1)
y<-5+3*x+2*(x>=0)+rnorm(1000)
rdbwselect(y,x)



