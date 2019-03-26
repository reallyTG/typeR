library(zipfextR)


### Name: zipfpssFit
### Title: Zipf-PSS parameters estimation.
### Aliases: zipfpssFit residuals.zipfpssR fitted.zipfpssR coef.zipfpssR
###   plot.zipfpssR print.zipfpssR summary.zipfpssR logLik.zipfpssR
###   AIC.zipfpssR BIC.zipfpssR

### ** Examples

data <- rzipfpss(100, 2.5, 1.3)
data <- as.data.frame(table(data))
data[,1] <- as.numeric(levels(data[,1])[data[,1]])
initValues <- getInitialValues(data, model='zipfpss')
obj <- zipfpssFit(data, init_alpha = initValues$init_alpha, init_lambda = initValues$init_lambda)



