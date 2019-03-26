library(pwr)


### Name: pwr.t.test
### Title: Power calculations for t-tests of means (one sample, two samples
###   and paired samples)
### Aliases: pwr.t.test
### Keywords: htest

### ** Examples


## One sample (power)
## Exercise 2.5 p. 47 from Cohen (1988)
pwr.t.test(d=0.2,n=60,sig.level=0.10,type="one.sample",alternative="two.sided")

## Paired samples (power)
## Exercise p. 50 from Cohen (1988)
d<-8/(16*sqrt(2*(1-0.6)))
pwr.t.test(d=d,n=40,sig.level=0.05,type="paired",alternative="two.sided")

## Two independent samples (power)
## Exercise 2.1 p. 40 from Cohen (1988)
d<-2/2.8
pwr.t.test(d=d,n=30,sig.level=0.05,type="two.sample",alternative="two.sided")

## Two independent samples (sample size)
## Exercise 2.10 p. 59
pwr.t.test(d=0.3,power=0.75,sig.level=0.05,type="two.sample",alternative="greater")




