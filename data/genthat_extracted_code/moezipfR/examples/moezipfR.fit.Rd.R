library(moezipfR)


### Name: moezipfR.fit
### Title: MOEZipf parameters estimation.
### Aliases: AIC.moezipfR BIC.moezipfR coef.moezipfR fitted.moezipfR
###   logLik.moezipfR moezipfR.fit plot.moezipfR print.moezipfR
###   residuals.moezipfR summary.moezipfR

### ** Examples

data <- rmoezipf(100, 2.5, 1.3)
data <- moezipfR.utils.getDataMatrix(data)
obj <- moezipfR.fit(data, 1.001, 0.001)



