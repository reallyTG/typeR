library(plspolychaos)


### Name: polyLeg
### Title: Calculate Legendre Polynomials on a Dataset
### Aliases: polyLeg
### Keywords: regression

### ** Examples

### Load the dataset
load(system.file("extdata", "ishigami200.Rda", package="plspolychaos"))
X <- ishi200[, -ncol(ishi200)] # inputs
Y <- ishi200[,  ncol(ishi200)] # output
degree <- 6 # polynomial degree
### Creation of the full polynomials
pce <- polyLeg(X, Y, degree) 
print(pce)
### Selection of the 50 most significant monomials
pcef <- polyLeg(X, Y, degree, forward=50)
print(pcef)



