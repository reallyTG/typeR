library(nsROC)


### Name: ROCbands
### Title: Confidence bands for ROC curves
### Aliases: ROCbands ROCbands.default
### Keywords: confidence

### ** Examples

# Basic example
set.seed(123)
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))
groc.obj <- gROC(X,D)

# PSN confidence bands with conf.level=0.95
ROCbands(groc.obj)
## No test: 
# Plot standard deviation estimate of the curve and confidence bands in the same window
ROCbands(groc.obj, plot.bands=TRUE, plot.var=TRUE)
# PSN confidence bands with alpha1 fixed (alpha1=0.025)
ROCbands(groc.obj, alpha1=0.025)

# JMS confidence bands in (0.2,0.7) interval
ROCbands(groc.obj, method="JMS", a.J=0.2, b.J=0.7)
# Plot variance estimate of the curve and confidence bands in the same window
ROCbands(groc.obj, method="JMS", a.J=0.2, b.J=0.7, plot.bands=TRUE, plot.var=TRUE)

# DEK confidence bands with conf.level=0.99
ROCbands(groc.obj, method="DEK", conf.level=0.99)
## End(No test)



