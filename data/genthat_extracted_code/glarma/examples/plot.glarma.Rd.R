library(glarma)


### Name: plot.glarma
### Title: Plot Diagnostics for a 'glarma' Object
### Aliases: plot.glarma
### Keywords: Diagnostic

### ** Examples

### A example from Davis, Dunsmuir Wang (1999)
## MA(1,2,5), Pearson Residuals, Fisher Scoring
data(Polio)
y <- Polio[, 2]
X <- as.matrix(Polio[, 3:8])
glarmamod <- glarma(y, X, thetaLags = c(1, 2, 5), type = "Poi",method = "FS",
                    residuals = "Pearson", maxit = 100 , grad = 1e-6)

## The default plots are shown
plot(glarmamod)

## The plots used only to compared GLARMA fit and the observed data
plot(glarmamod, which = 1L, fits = c(1, 3))



