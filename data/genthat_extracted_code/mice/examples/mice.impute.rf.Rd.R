library(mice)


### Name: mice.impute.rf
### Title: Imputation by random forests
### Aliases: mice.impute.rf
### Keywords: datagen

### ** Examples

library("lattice")

imp <- mice(nhanes2, meth = "rf", ntree = 3)
plot(imp)




