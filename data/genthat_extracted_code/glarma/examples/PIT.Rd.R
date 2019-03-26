library(glarma)


### Name: PIT
### Title: Non-randomized Probability Integral Transformation
### Aliases: glarmaPredProb glarmaPIT
### Keywords: ts

### ** Examples

### Example from Davis, Dunsmuir Wang (1999)
## MA(1,2,5), Pearson Residuals, Fisher Scoring
data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])
glarmamod <- glarma(y, X, thetaLags = c(1,2,5), type = "Poi", method = "FS",
                    residuals = "Pearson", maxit = 100, grad = 2.22e-16)
glarmaPredProb(glarmamod)
glarmaPIT(glarmamod)



