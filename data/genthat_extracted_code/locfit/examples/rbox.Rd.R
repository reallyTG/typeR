library(locfit)


### Name: rbox
### Title: Local Regression, Likelihood and Density Estimation.
### Aliases: rbox
### Keywords: smooth

### ** Examples

data(ethanol, package="locfit")
plot.eval(locfit(NOx~E+C,data=ethanol,scale=0,ev=rbox(cut=0.8)))
plot.eval(locfit(NOx~E+C,data=ethanol,scale=0,ev=rbox(cut=0.3)))



