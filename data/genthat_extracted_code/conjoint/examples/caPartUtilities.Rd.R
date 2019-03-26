library(conjoint)


### Name: caPartUtilities
### Title: Function caPartUtilities calculates matrix of individual
###   utilities
### Aliases: caPartUtilities
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
uslall<-caPartUtilities(tprefm,tprof,tlevn)
print(uslall)

#Example 2
library(conjoint)
data(chocolate)
uslall<-caPartUtilities(cprefm,cprof,clevn)
print(head(uslall))

#Example 3
library(conjoint)
data(journey)
usl<-caPartUtilities(jpref[1,],jprof,jlevn)
print("Individual (partial) utilities for first respondent:")
print(usl)



