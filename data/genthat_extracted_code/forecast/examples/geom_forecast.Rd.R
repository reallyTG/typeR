library(forecast)


### Name: StatForecast
### Title: Forecast plot
### Aliases: StatForecast GeomForecast geom_forecast
### Keywords: datasets

### ** Examples


## Not run: 
##D library(ggplot2)
##D autoplot(USAccDeaths) + geom_forecast()
##D 
##D lungDeaths <- cbind(mdeaths, fdeaths)
##D autoplot(lungDeaths) + geom_forecast()
##D 
##D # Using fortify.ts
##D p <- ggplot(aes(x=x, y=y), data=USAccDeaths)
##D p <- p + geom_line()
##D p + geom_forecast()
##D 
##D # Without fortify.ts
##D data <- data.frame(USAccDeaths=as.numeric(USAccDeaths), time=as.numeric(time(USAccDeaths)))
##D p <- ggplot(aes(x=time, y=USAccDeaths), data=data)
##D p <- p + geom_line()
##D p + geom_forecast()
##D 
##D p + geom_forecast(h=60)
##D p <- ggplot(aes(x=time, y=USAccDeaths), data=data)
##D p + geom_forecast(level=c(70,98))
##D p + geom_forecast(level=c(70,98),colour="lightblue")
##D 
##D #Add forecasts to multivariate series with colour groups
##D lungDeaths <- cbind(mdeaths, fdeaths)
##D autoplot(lungDeaths) + geom_forecast(forecast(mdeaths), series="mdeaths")
## End(Not run)




