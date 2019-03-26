library(pwr)


### Name: pwr.chisq.test
### Title: power calculations for chi-squared tests
### Aliases: pwr.chisq.test
### Keywords: htest

### ** Examples


## Exercise 7.1 P. 249 from Cohen (1988) 
pwr.chisq.test(w=0.289,df=(4-1),N=100,sig.level=0.05)

## Exercise 7.3 p. 251
pwr.chisq.test(w=0.346,df=(2-1)*(3-1),N=140,sig.level=0.01)

## Exercise 7.8 p. 270
pwr.chisq.test(w=0.1,df=(5-1)*(6-1),power=0.80,sig.level=0.05)



