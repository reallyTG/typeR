library(kdecopula)


### Name: plot.kdecopula
### Title: Plotting 'kdecopula' objects
### Aliases: plot.kdecopula contour.kdecopula contour.kdecopula
### Keywords: plot

### ** Examples


## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x)/(length(x)+1))

## estimation of copula density of variables 5 and 6
obj <- kdecop(udat[, 5:6])

## plots
plot(obj)  # surface plot of copula density
contour(obj)  # contour plot with standard normal margins
contour(obj, margins = "unif")  # contour plot of copula density




