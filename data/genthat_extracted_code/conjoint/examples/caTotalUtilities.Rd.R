library(conjoint)


### Name: caTotalUtilities
### Title: Function caTotalUtilities calculates matrix of theoreticall
###   total utilities
### Aliases: caTotalUtilities
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
uslall<-caTotalUtilities(tprefm,tprof)
print(uslall)

#Example 2
library(conjoint)
data(chocolate)
uslall<-caTotalUtilities(cprefm,cprof)
print(uslall)

#Example 3
library(conjoint)
data(journey)
usl<-caTotalUtilities(jpref[1,],jprof)
print("Individual (total) utilities for first respondent:")
print(usl)



