library(covsep)


### Name: gaussian_bootstrap_test
### Title: Projection-based Gaussian (parametric) bootstrap test for
###   separability of covariance structure
### Aliases: gaussian_bootstrap_test

### ** Examples

data(SurfacesData)
## No test: 
gaussian_bootstrap_test(SurfacesData)
## End(No test)
gaussian_bootstrap_test(SurfacesData, B=100)
## No test: 
gaussian_bootstrap_test(SurfacesData, L1=2,L2=2,B=1000, studentize='full')
## End(No test)




