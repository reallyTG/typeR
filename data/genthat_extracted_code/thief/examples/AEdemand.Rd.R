library(thief)


### Name: AEdemand
### Title: Accident and Emergency demand in the UK
### Aliases: AEdemand
### Keywords: datasets

### ** Examples

library(ggplot2)
autoplot(AEdemand, xlab="Year", ylab="Demand ('000)") +
  ggtitle("Accident & Emergency Demand in the UK")

## Not run: 
##D 
##D # Demonstration of the adjustment of all temporal aggregates
##D # using Total Emergency Admissions
##D 
##D total <- AEdemand[,12]
##D totalagg <- tsaggregates(total)
##D plot(totalagg, main="Total Emergency Admissions")
##D 
##D # Base forecasts
##D base <- list()
##D for(i in 1:5)
##D   base[[i]] <- forecast(auto.arima(totalagg[[i]]))
##D base[[6]] <-  forecast(auto.arima(totalagg[[6]]), h=2)
##D 
##D # Reconciled forecasts
##D reconciled <- reconcilethief(base)
##D 
##D main <- paste(names(totalagg)," (k=",
##D            52/unlist(lapply(reconciled,frequency)),")",sep="")
##D par(mfrow=c(2,3))
##D for(i in 6:1)
##D {
##D   ylim <- range(base[[i]]$mean, base[[i]]$x, reconciled[[i]]$mean)
##D   plot(base[[i]], main=main[i], fcol='white',
##D       plot.conf=FALSE, ylim=ylim, xlim=c(2010.5,2017.5))
##D   polygon(c(2015.45, 2020, 2020, 2015.45),
##D           c(0, 0, 1e5, 1e5), col='grey', border=FALSE)
##D   lines(base[[i]]$mean, col='red', lty=2)
##D   lines(reconciled[[i]]$mean, col='blue')
##D }
## End(Not run)



