library(pwr)


### Name: pwr.2p2n.test
### Title: Power calculation for two proportions (different sample sizes)
### Aliases: pwr.2p2n.test
### Keywords: htest

### ** Examples

## Exercise 6.3 P. 200 from Cohen (1988)
pwr.2p2n.test(h=0.30,n1=80,n2=245,sig.level=0.05,alternative="greater")

## Exercise 6.7 p. 207 from Cohen (1988)
pwr.2p2n.test(h=0.20,n1=1600,power=0.9,sig.level=0.01,alternative="two.sided")



