library(simPop)


### Name: dataObj-class
### Title: Class '"dataObj"'
### Aliases: dataObj-class show,dataObj-method
### Keywords: classes

### ** Examples

showClass("dataObj")

## show method, generate an object of class dataObj first
data(eusilcS)
inp <- specifyInput(data=eusilcS, hhid="db030", weight="rb050", strata="db040")
## shows some basic information:
inp




