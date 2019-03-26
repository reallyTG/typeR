library(polychaosbasics)


### Name: analyticsPolyLeg
### Title: Calculate Legendre Polynomials on a Simulated Dataset
### Aliases: analyticsPolyLeg
### Keywords: regression

### ** Examples

nlhs <- 200 # number of rows in the dataset
degree <- 6 # polynomial degree
set.seed(42) # fix the seed for reproductible results
pce <- analyticsPolyLeg(nlhs, degree, 'ishigami') 
print(pce)



