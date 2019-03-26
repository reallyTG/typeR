library(pwr)


### Name: ES.h
### Title: Effect size calculation for proportions
### Aliases: ES.h
### Keywords: htest

### ** Examples

## Exercise 6.5 p. 203 from Cohen 
h<-ES.h(0.5,0.4)
h
pwr.p.test(h=h,n=60,sig.level=0.05,alternative="two.sided")



