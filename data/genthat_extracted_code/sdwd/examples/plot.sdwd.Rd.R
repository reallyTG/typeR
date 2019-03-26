library(sdwd)


### Name: plot.sdwd
### Title: plot coefficients for the sparse DWD
### Aliases: plot.sdwd
### Keywords: models regression

### ** Examples

data(colon)
fit = sdwd(colon$x, colon$y)
par(mfrow=c(1,3))
# plots against the L1-norm of the coefficients
plot(fit) 
# plots against the log-lambda sequence
plot(fit, xvar="lambda", label=TRUE)
# plots with colors
plot(fit, color=TRUE)



