library(MVT)


### Name: homogeneity.test
### Title: Test of variance homogeneity of correlated variances
### Aliases: homogeneity.test
### Keywords: htest

### ** Examples

data(examScor)
fit <- studentFit(examScor, family = Student(eta = .25))
fit

z <- homogeneity.test(fit, test = "LRT")
z



