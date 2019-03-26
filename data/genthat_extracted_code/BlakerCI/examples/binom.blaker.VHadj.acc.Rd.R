library(BlakerCI)


### Name: binom.blaker.VHadj.acc
### Title: Blaker's binomial acceptability function with Vos-Hudson
###   adjustment.
### Aliases: binom.blaker.VHadj.acc
### Keywords: htest

### ** Examples

p <- seq(0,1,length=10001)
acc.adj <- binom.blaker.VHadj.acc(6,13,p)
acc <- binom.blaker.acc(6,13,p)

plot(p,acc.adj,type="l",col="red",ylab="acceptability"
  ,main=paste("Vos-Hudson adjustment of acceptability function"
  ,"for 6 successes in 13 trials"
  , sep="\n")
)
lines(p,acc,type="l")
legend(x=.7,y=.8,c("unadjusted","adjustment"),col=c("black","red"),lwd=1)

## Plot of differences between the unadjusted and adjusted
## acceptability functions reveals some adjustment details
## hardly visible in the previous graph. 

plot(p,acc.adj-acc,type="l",ylab="acceptability difference")

## The narrow peak near 0.215 is close to the 
## Blaker's lower 0.95 confidence limit.
## 
## Focussing on the neighbourhood of 0.215:

p <- seq(0.21,0.22,length=1001)
acc.adj <- binom.blaker.VHadj.acc(6,13,p)
acc <- binom.blaker.acc(6,13,p)

plot(p,acc.adj,type="l",col="red",ylab="acceptability"
  ,main=paste("A detail of Vos-Hudson adjustment of acceptability function"
  ,"for 6 successes in 13 trials"
  ,sep="\n")
  ,ylim=c(0.02,0.09)
)
lines(p,acc,type="l")
legend(x=.210,y=.08,c("unadjusted","adjustment"),col=c("black","red"),lwd=1)

## The above adjustment results from the fact that, though
## 15 > 13 and 7/15 > 6/13, the acceptability function
## for 7 successes in 15 trials is greater that that for 6 successes
## in 13 trials on a short interval:

acc.7.15 <- binom.blaker.acc(7,15,p)
plot(p,acc,type="l",ylab="acceptability"
  ,main=paste("A detail of acceptability functions"
  ,sep="\n")
  ,ylim=c(0.02,0.09)
)
lines(p,acc.7.15,type="l",col="green")
legend(x=.210,y=.08,c("6 / 13","7 / 15"),col=c("black","green")
  ,title="succ / trials",lwd=1)

## The adjustment shifts the point where the 0.05 level is exceeded,
## i. e. the Blaker's lower 0.95 confidence limit, from 0.2158 to 0.2150. 
## (Compare with Examples in binom.blaker.VHadj.limits section.)



