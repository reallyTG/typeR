library(plspolychaos)


### Name: calcPLSPCE
### Title: Compute PLS-PCE Sensitivity Indexes
### Aliases: calcPLSPCE
### Keywords: regression

### ** Examples

### Load the dataset
load(system.file("extdata",  "ishigami200.Rda", package="plspolychaos"))
X <- ishi200[, -ncol(ishi200)] # inputs
Y <- ishi200[,  ncol(ishi200)] # output
### Creation of the full polynomials
degree <- 6 # polynomial degree
pce <- polyLeg(X, Y, degree) 
### Compute the PLS-PCE sensitivity indexes for 25 components
ret <-  calcPLSPCE(pce, nc=25) 



