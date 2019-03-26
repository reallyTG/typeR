library(plspolychaos)


### Name: plspolychaos-package
### Title: Sensitivity Indexes from Polynomial Chaos Expansions and PLS
### Aliases: plspolychaos-package plspolychaos
### Keywords: package regression

### ** Examples

### First example: the dataset is simulated
nlhs <- 200 # number of rows
degree <- 6 # polynomial degree
set.seed(42)# fix the seed for reproductible results
# Generate data and calculate Legendre polynomials
# Independent inputs; response calculated by the Ishigami function
pce <- analyticsPolyLeg(nlhs, degree, 'ishigami')
# Compute the PLS-PCE sensitivity indexes for ten components
ret <- calcPLSPCE(pce, nc=10) 
# Plot the result
## Not run: plot(ret, pce)

### Second example: the dataset is provided and the
### most significant monomials are selected
# Load the dataset
load(system.file("extdata",  "ishigami200.Rda", package="plspolychaos"))
X <- ishi200[, -ncol(ishi200)] # inputs
Y <- ishi200[,  ncol(ishi200)] # output
# Build Legendre polynomial with the 50 most significant monomials
pce <- polyLeg(X, Y, degree=6, forward=50) 
# Compute the PLS-PCE sensitivity indexes 
ret <-  calcPLSPCE(pce, nc=10) 
print(ret, all=TRUE)



