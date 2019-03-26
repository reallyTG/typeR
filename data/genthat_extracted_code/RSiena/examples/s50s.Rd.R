library(RSiena)


### Name: s50s
### Title: Smoking data: excerpt from "Teenage Friends and Lifestyle Study"
###   data
### Aliases: s50s
### Keywords: datasets

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
myvar <- varCovar(s50s)
mydata <- sienaDataCreate(mynet, myvar)
mydata



