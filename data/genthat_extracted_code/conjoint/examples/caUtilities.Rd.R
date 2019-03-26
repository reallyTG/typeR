library(conjoint)


### Name: caUtilities
### Title: Function caUtilities calculates utilities of levels of
###   atrtributes
### Aliases: caUtilities
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
uslall<-caUtilities(tprefm,tprof,tlevn)
print(uslall)

#Example 2
library(conjoint)
data(chocolate)
uslall<-caUtilities(cprefm,cprof,clevn)
print(uslall)

#Example 3
library(conjoint)
data(journey)
usl<-caUtilities(jpref[1,],jprof,jlevn)
print("Individual utilities for first respondent:")
print(usl)



