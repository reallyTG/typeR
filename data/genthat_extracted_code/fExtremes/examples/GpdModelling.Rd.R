library(fExtremes)


### Name: GpdModelling
### Title: GPD Distributions for Extreme Value Theory
### Aliases: GpdModelling fGPDFIT fGPDFIT-class show,fGPDFIT-method gpdSim
###   gpdFit plot.fGPDFIT summary.fGPDFIT
### Keywords: distribution

### ** Examples

## gpdSim  -
   x = gpdSim(model = list(xi = 0.25, mu = 0, beta = 1), n = 1000)
## gpdFit - 
   par(mfrow = c(2, 2), cex = 0.7)  
   fit = gpdFit(x, u = min(x), type = "pwm") 
   print(fit)
   summary(fit)   



