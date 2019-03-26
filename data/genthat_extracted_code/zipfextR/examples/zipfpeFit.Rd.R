library(zipfextR)


### Name: zipfpeFit
### Title: Zipf-PE parameters estimation.
### Aliases: zipfpeFit residuals.zipfpeR fitted.zipfpeR coef.zipfpeR
###   plot.zipfpeR print.zipfpeR summary.zipfpeR logLik.zipfpeR AIC.zipfpeR
###   BIC.zipfpeR

### ** Examples

data <- rzipfpe(100, 2.5, 1.3)
data <- as.data.frame(table(data))
data[,1] <- as.numeric(levels(data[,1])[data[,1]])
initValues <- getInitialValues(data, model='zipfpe')
obj <- zipfpeFit(data, init_alpha = initValues$init_alpha, init_beta = initValues$init_beta)



