library(zipfextR)


### Name: moezipfFit
### Title: MOEZipf parameters estimation.
### Aliases: moezipfFit residuals.moezipfR fitted.moezipfR coef.moezipfR
###   plot.moezipfR print.moezipfR summary.moezipfR logLik.moezipfR
###   AIC.moezipfR BIC.moezipfR

### ** Examples

data <- rmoezipf(100, 2.5, 1.3)
data <- as.data.frame(table(data))
data[,1] <- as.numeric(levels(data[,1])[data[,1]])
initValues <- getInitialValues(data, model='moezipf')
obj <- moezipfFit(data, init_alpha = initValues$init_alpha, init_beta = initValues$init_beta)



