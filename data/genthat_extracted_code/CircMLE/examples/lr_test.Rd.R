library(CircMLE)


### Name: lr_test
### Title: Likelihood ratio test for nested models
### Aliases: lr_test
### Keywords: chi-square distribution likelihood ratio test

### ** Examples

testdata = circular::rvonmises(100, mu = circular::circular(pi), kappa = 3)
lr_test(testdata, "M1", "M2A")



