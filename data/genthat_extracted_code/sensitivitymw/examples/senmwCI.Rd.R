library(sensitivitymw)


### Name: senmwCI
### Title: Point estimate and confidence interval for sensitivity analysis
###   in observational studies using weighted Huber-Maritz M-statistics.
### Aliases: senmwCI

### ** Examples

data(mercury)
senmwCI(mercury,gamma=2,method="w",one.sided=FALSE,detail=TRUE)

#The following example reproduces part of Table 1 in Rosenbaum (2007).  
#In particular, the one-sided .95 confidence interval is tau >= 0.1812, 
#and the P-value testing tau=0.1812 is 0.05.  
#Similarly, the test statistic equals its null expectation at tau=0.3403, 
#and when evaluated at -yrpcp the same thing happens at tau=-0.6666.
data(erpcp)
senmwCI(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1)
senmw(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=0.1812)
senmw(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=0.3403)
senmw(-erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=-0.6666)


#This example illustrates the relationship between senmwCI and senmw.  
#Note that the endpoints from senmwCI are tested by senmw.  
#Also for illustration, the search interval in this case is specified as from 0 to 5.
senmwCI(mercury,gamma=2,method="w",detail=TRUE,interval=c(0,5),one.sided=FALSE)
senmw(mercury,gamma=2,method="w",tau=2.03135)
senmw(-mercury,gamma=2,method="w",tau=-3.166710)
senmw(mercury,gamma=2,method="w",tau=1.775008)
senmw(-mercury,gamma=2,method="w",tau=-3.605779)



