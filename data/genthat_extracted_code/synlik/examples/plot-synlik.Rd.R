library(synlik)


### Name: plot-synlik
### Title: Method for plotting an object of class 'synlik'.
### Aliases: plot,synlik,missing-method plot-synlik

### ** Examples

data(ricker_sl)

# Using ricker_sl@plotFun
plot(ricker_sl)

# Using generic plot, doesn't work well because object@data is a matrix. 
ricker_sl@plotFun <- NULL
plot(ricker_sl)




