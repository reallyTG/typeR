library(nparLD)


### Name: ld.f1
### Title: Nonparametric Tests for the LD-F1 Design
### Aliases: ld.f1
### Keywords: htest

### ** Examples

## Example with the "Panic disorder study I" data ##
data(panic)
attach(panic)
w.pat<-c(5,4,3,2,5)
ex.f1<-ld.f1(y=resp, time=time, subject=subject, w.pat=w.pat, time.name="Week", 
description=FALSE, time.order=c(0,2,4,6,8))
# LD F1 Model 
# ----------------------- 
# Check that the order of the time level is correct.
# Time level:   0 2 4 6 8 
# If the order is not correct, specify the correct order in time.order.

## Wald-type statistic 
ex.f1$Wald.test

#     Statistic df p-value
#Week  126.6946  4 1.9822e-26

## ANOVA-type statistic
ex.f1$ANOVA.test

#     Statistic       df p-value
#Week  36.93664 2.234135 1.975781e-18



