library(EL2Surv)


### Name: ptwiseELtest
### Title: The pointwise likelihood ratio test
### Aliases: ptwiseELtest

### ** Examples

library(EL2Surv)
ptwiseELtest(hepatitis)
## It produces the estimates on 44 distinct uncensored days
## out of 57 possibly repeated uncensored days.

ptwiseELtest(hepatitis, t1 = 30, t2 = 60)
## It produces the estimates on 12 distinct uncensored days
## on the restricted time interval [30, 60].




