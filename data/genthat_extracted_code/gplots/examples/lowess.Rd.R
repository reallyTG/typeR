library(gplots)


### Name: lowess
### Title: Scatter Plot Smoothing
### Aliases: lowess lowess.default lowess.formula plot.lowess plotLowess
###   lowess
### Keywords: smooth

### ** Examples

data(cars)

#
# x,y method
#
plot(cars$speed, cars$dist, main="lowess(cars)")
lines(lowess(cars$speed, cars$dist), col=2)
lines(lowess(cars$speed, cars$dist, f=.2), col=3)
legend(5, 120, c(paste("f=", c("2/3", ".2"))), lty=1, col=2:3)

#
# formula method: plot, then calculate the lowess smoother,
#                 then add smooth to the plot
#
plot(dist ~ speed, data=cars, main="lowess(cars)")
lines(lowess(dist ~ speed, data=cars), col=2, lty=2)
lines(lowess(dist ~ speed, data=cars, f=.2), col=3) # smaller bandwith
legend(5, 120, c(paste("f=", c("2/3", ".2"))), lty=1, col=2:3)

#
# formula method: calculate lowess() smoother, then call plot()
#                  on the lowess object
#
lw <- lowess(dist ~ speed, data=cars)
plot(lw, main="lowess(cars)"  )

#
# formula method: calculate and plot in a single command
#
plotLowess(dist ~ speed, data=cars, main="lowess(cars)")

## Don't show: 
# test non-standard evaluation

with(cars, plotLowess(dist ~ speed, main="lowess(cars)") )
with(cars, plot(lowess(dist ~ speed, main="lowess(cars)") ) )

idx <- cars$speed > 10
plotLowess(dist[idx] ~ speed[idx], data=cars, main="lowess(cars)")
plot(lowess(dist[idx] ~ speed[idx], data=cars, main="lowess(cars)"))

with(cars, plotLowess(dist[idx] ~ speed[idx], main="lowess(cars)") )
with(cars, plot(lowess(dist[idx] ~ speed[idx], main="lowess(cars)") ))

local({
dist <- cars$dist
speed <- cars$speed
plotLowess(dist[idx] ~ speed[idx], main="lowess(cars)")
plot(lowess(dist[idx] ~ speed[idx], main="lowess(cars)"))
})
## End(Don't show) 




