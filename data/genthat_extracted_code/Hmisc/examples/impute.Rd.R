library(Hmisc)


### Name: impute
### Title: Generic Functions and Methods for Imputation
### Aliases: impute impute.default print.impute summary.impute [.impute
###   is.imputed
### Keywords: methods math htest models

### ** Examples

age <- c(1,2,NA,4)
age.i <- impute(age)
# Could have used impute(age,2.5), impute(age,mean), impute(age,"random")
age.i
summary(age.i)
is.imputed(age.i)



