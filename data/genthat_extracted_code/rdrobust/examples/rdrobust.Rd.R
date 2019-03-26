library(rdrobust)


### Name: rdrobust
### Title: Local-Polynomial RD Estimation with Robust Confidence Intervals
### Aliases: rdrobust print.rdrobust summary.rdrobust
### Keywords: RDD Robust Estimation

### ** Examples
 
x<-runif(1000,-1,1)
y<-5+3*x+2*(x>=0)+rnorm(1000)
rdrobust(y,x)



