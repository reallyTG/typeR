library(fractal)


### Name: fractalBlock
### Title: Class constructor for block-dependent estimators for stochastic
###   fractal time series
### Aliases: fractalBlock eda.plot.fractalBlock plot.fractalBlock
###   print.fractalBlock
### Keywords: methods

### ** Examples

## construct a fractalBlock object 
xvar <- 2^(1:10)
yvar <- 0.3^(1:10)
z <- fractalBlock(domain="time", estimator="estimator", exponent=pi, exponent.name="PI",
    scale=xvar, stat=yvar, stat.name="My Stat",
    detrend=NULL, overlap=0.2, data.name="My Series",
    sum.order=-1, series=rnorm(2^10),
    logfit=lm(y ~ x, data=data.frame(x=log(xvar), y=log(yvar))))

## print the result 
print(z)

## plot the result 
plot(z)



