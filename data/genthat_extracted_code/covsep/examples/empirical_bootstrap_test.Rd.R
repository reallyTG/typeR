library(covsep)


### Name: empirical_bootstrap_test
### Title: Projection-based empirical bootstrap test for separability of
###   covariance structure
### Aliases: empirical_bootstrap_test

### ** Examples

data(SurfacesData)
## No test: 
empirical_bootstrap_test(SurfacesData)
## End(No test)
empirical_bootstrap_test(SurfacesData, B=100)
## No test: 
empirical_bootstrap_test(SurfacesData,L1=2,L2=2, B=1000, studentize='full')
## End(No test)



