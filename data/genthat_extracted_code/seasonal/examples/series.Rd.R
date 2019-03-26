library(seasonal)


### Name: series
### Title: Import X-13ARIMA-SEATS Output Tables
### Aliases: series

### ** Examples


## Not run: 
##D 
##D m <- seas(AirPassengers)
##D series(m, "fct")  # re-evaluate with the forecast spec activated 
##D 
##D # more than one series
##D series(m, c("rsd", "fct"))
##D 
##D m <- seas(AirPassengers, forecast.save = "fct")
##D series(m, "fct") # no re-evaluation (much faster!)
##D 
##D # using long names
##D series(m, "forecast.forecasts")
##D 
##D # history spec
##D series(m, "history.trendestimates") 
##D series(m, "history.sfestimates") 
##D series(m, "history.saestimates") 
##D series(m, c("history.sfestimates", "history.trendestimates")) 
##D 
##D # slidingspans spec
##D series(m, "slidingspans.sfspans") 
##D series(m, "slidingspans.tdspans") 
##D 
##D # fundamental identities of seasonal adjustment 
##D # Y = T * I * (S * TD)
##D all.equal(AirPassengers, series(m, "seats.trend") * 
##D          series(m, "seats.irregular") * series(m, "seats.adjustfac"))
##D # Y_sa = Y / (S * TD)
##D all.equal(final(m), AirPassengers / series(m, "seats.adjustfac"))
##D 
##D ### Some X-13ARIMA-SEATS functions can be replicated in R:
##D 
##D # X-13ARIMA-SEATS spectrum
##D plot(series(m, "spectrum.specorig")[,-1], t = "l")
##D # R equivalent: spectrum from stats
##D spectrum(diff(log(AirPassengers)), method = "ar")
##D 
##D # X-13ARIMA-SEATS pacf
##D x13.pacf <- series(m, "identify.pacf")
##D plot(x13.pacf[,1], t = "h")
##D lines(x13.pacf[,2])
##D lines(-x13.pacf[,2])
##D # R equivalent: pacf from stats
##D pacf(AirPassengers, lag.max = 35)
## End(Not run)



