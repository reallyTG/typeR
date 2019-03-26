library(scaleboot)


### Name: plot.scaleboot
### Title: Plot Diagnostics for Multiscale Bootstrap
### Aliases: plot.scaleboot plot.summary.scaleboot lines.scaleboot sblegend
###   plot.scalebootv plot.summary.scalebootv
### Keywords: hplot models

### ** Examples

data(mam15)
## a single plot
a <- mam15.relltest[["t4"]] # an object of class "scaleboot"
plot(a,legend="topleft") # x=sigma^2, y=psi
plot(a,xval="inverse",yval="zvalue",
     legend="topleft") # x=1/sigma, y=z-value
plot(a,xval="sigma",log="x",yval="pvalue",
     legend="topleft") # x=log(sigma), y=probability
## plot of extrapolation
plot(summary(a),legend="topleft")
## multiple plots
b <- mam15.relltest[1:15] # an object of class "scalebootv"
plot(b) # x=sigma^2, y=psi



