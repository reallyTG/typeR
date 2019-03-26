library(RSiena)


### Name: s50
### Title: Network data: excerpt from "Teenage Friends and Lifestyle Study"
###   data.
### Aliases: s50
### Keywords: datasets

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mydata <- sienaDataCreate(mynet, mybeh)
mydata



