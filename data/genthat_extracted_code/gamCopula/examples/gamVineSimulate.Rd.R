library(gamCopula)


### Name: gamVineSimulate
### Title: Simulation from a 'gamVine-class' object
### Aliases: gamVineSimulate

### ** Examples

require(VineCopula)

## Example adapted from RVineSim

## Define 5-dimensional R-vine tree structure matrix
Matrix <- c(5, 2, 3, 1, 4,
            0, 2, 3, 4, 1,
            0, 0, 3, 4, 1,
            0, 0, 0, 4, 1,
            0, 0, 0, 0, 1)
Matrix <- matrix(Matrix, 5, 5)

## Define R-vine pair-copula family matrix
family <- c(0, 1, 3, 4, 4,
            0, 0, 3, 4, 1,
            0, 0, 0, 4, 1,
            0, 0, 0, 0, 3,
            0, 0, 0, 0, 0)
family <- matrix(family, 5, 5)

## Define R-vine pair-copula parameter matrix
par <- c(0, 0.2, 0.9, 1.5, 3.9,
         0, 0, 1.1, 1.6, 0.9,
         0, 0, 0, 1.9, 0.5,
         0, 0, 0, 0, 4.8,
         0, 0, 0, 0, 0)
par <- matrix(par, 5, 5)

## Define second R-vine pair-copula parameter matrix
par2 <- matrix(0, 5, 5)

## Define RVineMatrix object
RVM <- RVineMatrix(Matrix = Matrix, family = family,
                   par = par, par2 = par2,
                   names = c("V1", "V2", "V3", "V4", "V5"))

## Convert to gamVine object
GVC <- RVM2GVC(RVM)

## U[0,1] random variates to be transformed to the copula sample
n <- 1e2
d <- 5
U <- matrix(runif(n*d), nrow = n)

## The output of gamVineSimulate correspond to that of RVineSim
sampleRVM <- RVineSim(n, RVM,U)
sampleGVC <- gamVineSimulate(n, GVC,U)
all.equal(sampleRVM, sampleGVC)

## Fit the two models and compare the estimated parameter
fitRVM <- RVM2GVC(RVineSeqEst(sampleRVM,RVM))
fitGVC <- gamVineSeqFit(sampleGVC,GVC)
all.equal(simplify2array(attr(fitRVM, "model")),
simplify2array(attr(fitGVC, "model")))



