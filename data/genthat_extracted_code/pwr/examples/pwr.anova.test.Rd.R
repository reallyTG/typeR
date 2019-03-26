library(pwr)


### Name: pwr.anova.test
### Title: Power calculations for balanced one-way analysis of variance
###   tests
### Aliases: pwr.anova.test
### Keywords: htest

### ** Examples

## Exercise 8.1 P. 357 from Cohen (1988) 
pwr.anova.test(f=0.28,k=4,n=20,sig.level=0.05)

## Exercise 8.10 p. 391
pwr.anova.test(f=0.28,k=4,power=0.80,sig.level=0.05)



