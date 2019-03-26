library(HelpersMG)


### Name: minmax.periodic
### Title: Search for minimum and maximum indices in periodic timeseries
### Aliases: minmax.periodic

### ** Examples

## Not run: 
##D library("HelpersMG")
##D # Generate a timeserie of time
##D time.obs <- NULL
##D for (i in 0:9) time.obs <- c(time.obs, c(0, 6, 12, 18)+i*24)
##D # For these time, generate a timeseries of temperatures
##D temp.obs <- rep(NA, length(time.obs))
##D temp.obs[3+(0:9)*4] <- rnorm(10, 25, 3)
##D temp.obs[1+(0:9)*4] <- rnorm(10, 10, 3)
##D for (i in 1:(length(time.obs)-1)) 
##D   if (is.na(temp.obs[i])) 
##D   temp.obs[i] <- mean(c(temp.obs[i-1], temp.obs[i+1]))
##D   if (is.na(temp.obs[length(time.obs)])) 
##D   temp.obs[length(time.obs)] <- temp.obs[length(time.obs)-1]/2
##D observed <- data.frame(time=time.obs, temperature=temp.obs)
##D # Search for the minimum and maximum values
##D r <- minmax.periodic(time.minmax.daily=c(Min=2, Max=15), 
##D observed=observed, period=24, colname.index="temperature")
##D 
##D # Estimate all the temperatures for these values
##D t <- index.periodic(minmax=r)
##D 
##D plot_errbar(x=t[,"time"], y=t[,"index"],
##D errbar.y=ifelse(is.na(t[,"sd"]), 0, 2*t[,"sd"]),
##D type="l", las=1, bty="n", errbar.y.polygon = TRUE, 
##D xlab="hours", ylab="Temperatures", ylim=c(0, 35), 
##D errbar.y.polygon.list = list(col="grey"))
##D 
##D plot_add(x=t[,"time"], y=t[,"index"], type="l")
##D 
##D plot_add(observed$time, observed$temperature, pch=19, cex=0.5)
## End(Not run)



