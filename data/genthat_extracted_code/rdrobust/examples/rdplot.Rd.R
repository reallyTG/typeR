library(rdrobust)


### Name: rdplot
### Title: Data-Driven Regression Discontinuity Plots
### Aliases: rdplot print.rdplot summary.rdplot
### Keywords: regression discontinuity RD plots binning partitioning tuning
###   parameter selection

### ** Examples

x<-runif(1000,-1,1)
y<-5+3*x+2*(x>=0)+rnorm(1000)
rdplot(y,x)



