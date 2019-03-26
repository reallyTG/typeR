library(RMKdiscrete)


### Name: binegbin
### Title: The bivariate negative binomial distribution
### Aliases: dbinegbin binegbin.logMV rbinegbin

### ** Examples

## The following two lines do the same thing:
dbinegbin(y=1,nu=1,p=0.9)
dbinegbin(y=c(1,1),nu=c(1,1,1),p=c(0.9,0.9,0.9))

dbinegbin(y=c(1,1,2,2,3,5),nu=c(1,1,1,2,2,2),p=0.9)
## Due to argument cycling, the above line is doing the following three steps:
dbinegbin(y=c(1,1),nu=c(1,1,1),p=c(0.9,0.9,0.9))
dbinegbin(y=c(2,2),nu=c(2,2,2),p=c(0.9,0.9,0.9))
dbinegbin(y=c(3,5),nu=c(1,1,1),p=c(0.9,0.9,0.9))

## Inputs to dbinegbin() can be matrices, too:
dbinegbin(y=matrix(c(1,1,2,2,3,5),ncol=2,byrow=TRUE),
  nu=matrix(c(1,1,1,2,2,2,1,1,1),ncol=3,byrow=TRUE),
  p=0.9)
  
## nu0 = 0 implies independence:
a <- dbinegbin(y=c(1,3),nu=c(0,1,2),p=c(0.1,0.5,0.9))
b <- dnegbin(x=1,nu=1,p=0.5) * dnegbin(x=3,nu=2,p=0.9)
a-b #<--near zero.

( y <- rbinegbin(10,nu=c(1.1,0.87,5.5),p=c(0.87,0.89,0.90)) )
dbinegbin(y=y,nu=c(1.1,0.87,5.5),p=c(0.87,0.89,0.90))
( mv <- negbinMVP(nu=c(1.1,0.87,5.5),p=c(0.87,0.89,0.90)) )
mv[1,2] #<--Covariance of this distribution
mv[1,2]+mv[2,2] #<--Marginal variance of Y1
mv[1,2]+mv[3,2] #<--Marginal variance of Y2
mv[1,2]/(sqrt(mv[1,2]+mv[2,2])*sqrt(mv[1,2]+mv[3,2])) #<--Correlation
logmv <- binegbin.logMV(nu=c(1.1,0.87,5.5),p=c(0.87,0.89,0.90))
## Log transformation nearly cuts the correlation in half:
logmv[1,5]/sqrt(logmv[1,3]*logmv[1,4])



