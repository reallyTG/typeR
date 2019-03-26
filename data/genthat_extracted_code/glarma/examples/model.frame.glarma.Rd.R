library(glarma)


### Name: model.frame.glarma
### Title: Extracting the Model Frame of the GLARMA Model
### Aliases: model.frame.glarma
### Keywords: Accessor Functions

### ** Examples

data(Polio)
print(y <- Polio[, 2])
X <- as.matrix(Polio[, 3:8])
str(X)
head(X)


glarmamod <- glarma(y, X, thetaLags = c(1, 2, 5), type = "Poi",
                    method = "FS", residuals = "Pearson",
                    maxit = 100, grad = 1e-6)

str(model.frame(glarmamod))
head(model.frame(glarmamod))



