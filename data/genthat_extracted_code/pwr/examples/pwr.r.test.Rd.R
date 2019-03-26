library(pwr)


### Name: pwr.r.test
### Title: Power calculations for correlation test
### Aliases: pwr.r.test
### Keywords: htest

### ** Examples


## Exercise 3.1 p. 96 from Cohen (1988)
pwr.r.test(r=0.3,n=50,sig.level=0.05,alternative="two.sided")
pwr.r.test(r=0.3,n=50,sig.level=0.05,alternative="greater")

## Exercise 3.4 p. 208
pwr.r.test(r=0.3,power=0.80,sig.level=0.05,alternative="two.sided")
pwr.r.test(r=0.5,power=0.80,sig.level=0.05,alternative="two.sided")
pwr.r.test(r=0.1,power=0.80,sig.level=0.05,alternative="two.sided")



