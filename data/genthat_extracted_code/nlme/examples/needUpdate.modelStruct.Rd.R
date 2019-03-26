library(nlme)


### Name: needUpdate.modelStruct
### Title: Check if a modelStruct Object Needs Updating
### Aliases: needUpdate.modelStruct needUpdate.corStruct
###   needUpdate.reStruct
### Keywords: models

### ** Examples

lms1 <- lmeStruct(reStruct = reStruct(pdDiag(diag(2), ~age)),
   varStruct = varPower(form = ~age))
needUpdate(lms1)



