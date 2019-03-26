library(VineCopula)


### Name: RVineCor2pcor
### Title: (Partial) Correlations for R-Vine Copula Models
### Aliases: RVineCor2pcor RVinePcor2cor
### Keywords: correlation partial vine

### ** Examples


## create RVineMatrix-object for Gaussian vine
Matrix <- matrix(c(1, 3, 4, 2,
                   0, 3, 4, 2,
                   0, 0, 4, 2,
                   0, 0, 0, 2), 4, 4)
family <- matrix(c(0, 1, 1, 1,
                   0, 0, 1, 1,
                   0, 0, 0, 1,
                   0, 0, 0, 0), 4, 4)
par <- matrix(c(0, 0.2,   0, 0.6,
                0,   0, 0.2, 0.6,
                0,   0,   0, 0.6,
                0,   0,   0,   0), 4, 4)
RVM <- RVineMatrix(Matrix, family, par)

## calculate correlation matrix corresponding to the R-Vine model
newcor <- RVinePcor2cor(RVM)

## transform back to partial correlations
RVineCor2pcor(RVM, newcor)$par

## check if they are equal
all.equal(RVM$par, RVineCor2pcor(RVM, newcor)$par)




