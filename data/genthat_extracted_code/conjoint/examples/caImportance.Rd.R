library(conjoint)


### Name: caImportance
### Title: Function caImportance calculates importance of all attributes
### Aliases: caImportance
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
imp<-caImportance(tprefm,tprof)
print("Importance summary: ", quote=FALSE)
print(imp)
print(paste("Sum: ", sum(imp)), quote=FALSE)

#Example 2
library(conjoint)
data(chocolate)
imp<-caImportance(cprefm,cprof)
print("Importance summary: ", quote=FALSE)
print(imp)
print(paste("Sum: ", sum(imp)), quote=FALSE)

#Example 3
library(conjoint)
data(journey)
imp<-caImportance(jpref[1,],jprof)
print("Importance summary of first respondent: ", quote=FALSE)
print(imp)
print(paste("Sum: ", sum(imp)), quote=FALSE)

#Example 4
library(conjoint)
data(journey)
imp<-caImportance(jpref[1:5,],jprof)
print("Importance summary of group of 5 respondents: ", quote=FALSE)
print(imp)
print(paste("Sum: ", sum(imp)), quote=FALSE)



