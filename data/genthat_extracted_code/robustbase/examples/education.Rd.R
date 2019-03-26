library(robustbase)


### Name: education
### Title: Education Expenditure Data
### Aliases: education
### Keywords: datasets

### ** Examples

data(education)
education.x <- data.matrix(education[, 3:5])
summary(lm.education <- lm(Y ~ Region + X1+X2+X3, data=education))

## See  example(lmrob.M.S) # for how robust regression is used



