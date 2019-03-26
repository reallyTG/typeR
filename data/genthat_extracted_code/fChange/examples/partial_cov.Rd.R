library(fChange)


### Name: partial_cov
### Title: Partial Sample Estimates of the Covariance Function in
###   Functional Data Analysis
### Aliases: partial_cov

### ** Examples

library(fda)
# generate functional data
fdata = fun_IID(n=100, nbasis=21)
# Estimated eigenvalues
e1 = partial_cov(fdata)$eigen_val
e2 = pca.fd(fdata, nharm = 21, centerfns = TRUE)$values
# e1 and e2 will both estimate the eigenvalues of the covariance
# operator based on the whole sample
# estimates using only 90% of the data
Cov = partial_cov(fdata, 0.9)




