library(simPop)


### Name: manageSimPopObj
### Title: get and set variables from population or sample data stored in
###   an object of class 'simPopObj'.
### Aliases: manageSimPopObj
### Keywords: manip

### ** Examples

data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040",
  weight="db090")
simPopObj <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))

(manageSimPopObj(simPopObj, var="age", sample=FALSE, set=FALSE))
(manageSimPopObj(simPopObj, var="age", sample=TRUE, set=FALSE))



