library(conjoint)


### Name: caModel
### Title: Function caModel estimates parameters of conjoint analysis model
### Aliases: caModel
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(tea)
model=caModel(tprefm[1,], tprof)
print(model)

#Example 2
library(conjoint)
data(chocolate)
model=caModel(cprefm[1,], cprof)
print(model)

#Example 3
library(conjoint)
data(journey)
model=caModel(jpref[306,], jprof)
print(model)



