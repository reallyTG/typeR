library(aTSA)


### Name: expsmooth
### Title: Simple Exponential Smoothing
### Aliases: expsmooth

### ** Examples

x <- rnorm(100)
es <- expsmooth(x) # trend = 1: a constant model
plot(x,type = "l")
lines(es$estimate,col = 2)
expsmooth(x,trend = 2) # trend = 2: a linear model
expsmooth(x,trend = 3) # trend = 3: a quadratic model



