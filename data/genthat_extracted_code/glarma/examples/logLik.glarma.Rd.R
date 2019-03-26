library(glarma)


### Name: logLik.glarma
### Title: Extract Log-Likelihood from GLARMA Models
### Aliases: logLik.glarma
### Keywords: Accessor Functions

### ** Examples

data(Polio)
Y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])
glarmamod <- glarma(Y, X, thetaLags = c(1, 2, 5), type = "Poi", method ="FS",
                    residuals = "Pearson", maxit = 100 , grad = 1e-6)

logLik(glarmamod, deriv = 0)
logLik(glarmamod, deriv = 1)
logLik(glarmamod, deriv = 2)



