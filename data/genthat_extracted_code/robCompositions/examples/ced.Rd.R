library(robCompositions)


### Name: ced
### Title: compositional error deviation
### Aliases: ced
### Keywords: manip

### ** Examples

data(expenditures)
x <- expenditures
x[1,3] <- NA
xi <- impKNNa(x)$xImp
ced(expenditures, xi, ni = sum(is.na(x)))



