library(pwr)


### Name: pwr.norm.test
### Title: Power calculations for the mean of a normal distribution (known
###   variance)
### Aliases: pwr.norm.test
### Keywords: htest

### ** Examples


## Power at mu=105 for H0:mu=100 vs. H1:mu>100 (sigma=15) 20 obs. (alpha=0.05) 
sigma<-15
c<-100
mu<-105
d<-(mu-c)/sigma
pwr.norm.test(d=d,n=20,sig.level=0.05,alternative="greater")

## Sample size of the test for power=0.80
pwr.norm.test(d=d,power=0.8,sig.level=0.05,alternative="greater")

## Power function of the same test
mu<-seq(95,125,l=100)
d<-(mu-c)/sigma
plot(d,pwr.norm.test(d=d,n=20,sig.level=0.05,alternative="greater")$power,
    type="l",ylim=c(0,1))
abline(h=0.05)
abline(h=0.80)

## Power function for the two-sided alternative
plot(d,pwr.norm.test(d=d,n=20,sig.level=0.05,alternative="two.sided")$power,
    type="l",ylim=c(0,1))
abline(h=0.05)
abline(h=0.80)



