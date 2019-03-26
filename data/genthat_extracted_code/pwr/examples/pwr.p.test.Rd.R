library(pwr)


### Name: pwr.p.test
### Title: Power calculations for proportion tests (one sample)
### Aliases: pwr.p.test
### Keywords: htest

### ** Examples


## Exercise 6.5 p. 203 from Cohen 
h<-ES.h(0.5,0.4)
h
pwr.p.test(h=h,n=60,sig.level=0.05,alternative="two.sided")

## Exercise 6.8 p. 208
pwr.p.test(h=0.2,power=0.95,sig.level=0.05,alternative="two.sided")




