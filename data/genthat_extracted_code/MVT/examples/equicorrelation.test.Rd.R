library(MVT)


### Name: equicorrelation.test
### Title: Equicorrelation test
### Aliases: equicorrelation.test
### Keywords: htest

### ** Examples

data(examScor)
fit <- studentFit(examScor, family = Student(eta = .25))
fit

z <- equicorrelation.test(fit, test = "LRT")
z



