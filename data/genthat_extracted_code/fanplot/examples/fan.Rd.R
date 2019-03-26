library(fanplot)


### Name: fan
### Title: Fan Plot of Distributions Percentiles Over Time.
### Aliases: fan fan0
### Keywords: aplot

### ** Examples

##
## Basic Fan: fan0()
##
fan0(th.mcmc)

##
## Basic Fan: fan()
##
# empty plot
plot(NULL, xlim = c(1, 945), ylim = range(th.mcmc)*0.85)

# add fan
fan(th.mcmc)

##
## 20 or so examples of fan charts and
## spaghetti plots based on the th.mcmc object
##
## Make sure you have zoo, tsbugs, RColorBrewer and 
## colorspace packages installed
##
## Not run: 
##D demo("sv_fan", "fanplot")
## End(Not run)

##
## Fans for forecasted values
##
## Not run: 
##D #create time series
##D net <- ts(ips$net, start=1975)
##D 
##D # fit model
##D library("forecast")
##D m <- auto.arima(net)
##D 
##D # plot in forecast package (limited customisation possible)
##D plot(forecast(m, h=5))
##D 
##D # another plot in forecast (with some customisation, no
##D # labels or anchoring possible at the moment)
##D plot(forecast(m, h=5, level=c(50,80,95)), 
##D      shadecols=rev(heat.colors(3)))
##D 
##D # simulate future values
##D mm <- matrix(NA, nrow=1000, ncol=5)
##D for(i in 1:1000)
##D   mm[i,] <- simulate(m, nsim=5)
##D 
##D # interval fan chart
##D plot(net, xlim=c(1975,2020), ylim=c(-100,300))
##D fan(mm, type="interval", start=2013)
##D 
##D # anchor fan chart
##D plot(net, xlim=c(1975,2020), ylim=c(-100,300))
##D fan(mm, type="interval", start=2013, 
##D     anchor=net[time(net)==2012])
##D 
##D # anchor spaghetti plot with underlying fan chart
##D plot(net, xlim=c(1975,2020), ylim=c(-100,300))
##D fan(mm, type="interval", start=2013, 
##D     anchor=net[time(net)==2012], alpha=0, ln.col="orange")
##D fan(mm, type="interval", start=2013, 
##D     anchor=net[time(net)==2012], alpha=0.5, style="spaghetti")
## End(Not run)

##
## Box Plots
##
# sample every 21st day of theta_t
th.mcmc21 <- th.mcmc[, seq(1, 945, 21)]
plot(NULL, xlim = c(1, 945), ylim = range(th.mcmc21))
fan(th.mcmc21, style = "boxplot", frequency = 1/21)

# additional arguments for boxplot
plot(NULL, xlim = c(1, 945), ylim = range(th.mcmc21))
fan(th.mcmc21, style = "boxplot", frequency = 1/21, 
 outline = FALSE, col = "red", notch = TRUE)

##
## Fan Boxes
##
plot(NULL, xlim = c(1, 945), ylim = range(th.mcmc21))
fan(th.mcmc21, style = "boxfan", type = "interval", frequency = 1/21)

# more space between boxes
plot(NULL, xlim = c(1, 945), ylim = range(th.mcmc21))
fan(th.mcmc21, style = "boxfan", type = "interval", 
 frequency = 1/21, space = 10)

# overlay spaghetti
fan(th.mcmc21, style = "spaghetti", 
 frequency = 1/21, n.spag = 50, ln.col = "red", alpha=0.2) 



