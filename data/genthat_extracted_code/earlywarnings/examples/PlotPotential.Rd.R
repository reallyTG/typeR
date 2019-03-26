library(earlywarnings)


### Name: PlotPotential
### Title: Description: Plot Potential
### Aliases: PlotPotential
### Keywords: early-warning

### ** Examples

X = c(rnorm(1000, mean = 0), rnorm(1000, mean = -2), rnorm(1000, mean = 2)); 
param = seq(0,5,length=3000); res <- movpotential_ews(X, param); 
PlotPotential(res$res, title = '', xlab.text = '', ylab.text = '', 
cutoff = 0.5, plot.contours = TRUE, binwidth = 0.2)



