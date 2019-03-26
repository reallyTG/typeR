library(RSiena)


### Name: s503
### Title: Network 3 data: excerpt from "Teenage Friends and Lifestyle
###   Study" data.
### Aliases: s503
### Keywords: datasets

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mydata <- sienaDataCreate(mynet, mybeh)



