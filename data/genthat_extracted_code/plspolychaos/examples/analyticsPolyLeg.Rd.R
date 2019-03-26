library(plspolychaos)


### Name: analyticsPolyLeg
### Title: Simulate a Dataset and Calculate Legendre Polynomials
### Aliases: analyticsPolyLeg
### Keywords: regression

### ** Examples

nlhs <- 200 # number of rows in the dataset
degree <- 6 # polynomial degree
set.seed(42) # fix the seed for reproductible results
### Data simulation and creation of the full polynomials
pce <- analyticsPolyLeg(nlhs, degree, 'ishigami') 
print(pce)
### Selection of the 50 most significant monomials
pcef <- analyticsPolyLeg(nlhs, degree, 'ishigami', forward=50)
print(pcef)



