library(mlegp)


### Name: plot.gp
### Title: Diagnostic Plots for Gaussian processes
### Aliases: plot.gp
### Keywords: hplot methods

### ** Examples


## fit the gp ##
x = seq(-5,5,by=.5)
y = sin(x) + rnorm(length(x), sd=.1)
fit = mlegp(x,y)

## plot diagnostics ##
plot(fit)
plot(fit, type = 2)



