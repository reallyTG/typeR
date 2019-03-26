library(fChange)


### Name: Cov_test
### Title: Testing the Equality of Covariance Operators in Functional
###   Samples
### Aliases: Cov_test

### ** Examples

# generate functional data
fdata1 = fun_IID(n=100, nbasis=21)
fdata2 = fun_IID(n=150, nbasis=21)
Cov_test(fdata1, fdata2, d=5)






