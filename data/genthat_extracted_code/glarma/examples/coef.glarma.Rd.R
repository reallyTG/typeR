library(glarma)


### Name: coef.glarma
### Title: Extract GLARMA Model Coefficients
### Aliases: coef.glarma coefficients.glarma
### Keywords: Accessor Functions

### ** Examples

data(Polio)
Y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])
glarmamod <- glarma(Y, X, thetaLags = c(1, 2, 5), type = "Poi",
                    method = "FS", residuals= "Pearson",
                    maxit = 100, grad = 1e-6)

coef(glarmamod, type = "ARMA")
coef(glarmamod, type = "beta")
coef(glarmamod, type = "all")



