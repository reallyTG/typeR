library(qualityTools)


### Name: ppPlot
### Title: Probability Plots for various distributions
### Aliases: ppPlot
### Keywords: Distribution Identification Six Sigma ~kwd1 ~kwd2

### ** Examples

#set up the plotting window for 6 plots
par(mfrow = c(3,2))

#generate random data from weibull distribution
x = rweibull(20, 8, 2)

#Probability Plot for different distributions
ppPlot(x, "log-normal")
ppPlot(x, "normal")
ppPlot(x, "exponential", DB = TRUE)
ppPlot(x, "cauchy")
ppPlot(x, "weibull")
ppPlot(x, "logistic")        




