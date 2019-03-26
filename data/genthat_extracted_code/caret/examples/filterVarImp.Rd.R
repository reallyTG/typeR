library(caret)


### Name: filterVarImp
### Title: Calculation of filter-based variable importance
### Aliases: filterVarImp
### Keywords: models

### ** Examples


data(mdrr)
filterVarImp(mdrrDescr[, 1:5], mdrrClass)

data(BloodBrain)

filterVarImp(bbbDescr[, 1:5], logBBB, nonpara = FALSE)
apply(bbbDescr[, 1:5],
      2,
      function(x, y) summary(lm(y~x))$coefficients[2,3],
      y = logBBB)

filterVarImp(bbbDescr[, 1:5], logBBB, nonpara = TRUE)




