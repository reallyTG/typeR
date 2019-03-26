library(qualityTools)


### Name: qqPlot
### Title: Quantile-Quantile Plots for various distributions
### Aliases: qqPlot
### Keywords: Distribution Identification Six Sigma

### ** Examples

#set up the plotting window for 6 plots
par(mfrow = c(3,2))

#generate random data from weibull distribution
x = rweibull(20, 8, 2)

#Quantile-Quantile Plot for different distributions
qqPlot(x, "log-normal")
qqPlot(x, "normal")
qqPlot(x, "exponential", DB = TRUE)
qqPlot(x, "cauchy")
qqPlot(x, "weibull")
qqPlot(x, "logistic")        



