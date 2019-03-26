library(epandist)


### Name: qepan
### Title: Quantile function for an uncensored epanechnikov distribution
### Aliases: qepan
### Keywords: distribution

### ** Examples

#Calculate the lower quartile of an epan-distributed variable:
qepan(p=.25,mu=0,r=sqrt(5))

#Use qepan to confirm analytical solution
#Find the quantile corresponding to p=(5+sqrt(5))/8=.9045 when mu=0 and r=sqrt(5):
qepan(p=(5+sqrt(5))/8,mu=0,r=sqrt(5))
#This is equal to
(5-sqrt(5))/2



