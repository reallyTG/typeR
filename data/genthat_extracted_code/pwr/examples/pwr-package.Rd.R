library(pwr)


### Name: pwr-package
### Title: Basic Functions for Power Analysis pwr
### Aliases: pwr-package pwr
### Keywords: package htest

### ** Examples

## Exercise 8.1 P. 357 from Cohen (1988) 
pwr.anova.test(f=0.28,k=4,n=20,sig.level=0.05)

## Exercise 6.1 p. 198 from Cohen (1988)
pwr.2p.test(h=0.3,n=80,sig.level=0.05,alternative="greater")

## Exercise 7.3 p. 251
pwr.chisq.test(w=0.346,df=(2-1)*(3-1),N=140,sig.level=0.01)

## Exercise 6.5 p. 203 from Cohen (1988)
pwr.p.test(h=0.2,n=60,sig.level=0.05,alternative="two.sided")



