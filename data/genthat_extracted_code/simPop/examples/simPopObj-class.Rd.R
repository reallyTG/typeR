library(simPop)


### Name: simPopObj-class
### Title: Class '"simPopObj"'
### Aliases: simPopObj-class show,simPopObj-method
### Keywords: classes

### ** Examples


showClass("simPopObj")

## show method: generate an object of class simPop first
data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", hhsize="hsize", strata="db040", weight="db090")
eusilcP <- simStructure(data=inp, method="direct", basicHHvars=c("age", "rb090"))
class(eusilcP)
## shows some basic information:
eusilcP




