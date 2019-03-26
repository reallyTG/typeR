library(seasonal)


### Name: seas
### Title: Seasonal Adjustment with X-13ARIMA-SEATS
### Aliases: seas

### ** Examples

## Not run: 
##D Basic call
##D m <- seas(AirPassengers) 
##D summary(m)
##D 
##D # Graphical user interface
##D view(m)
##D 
##D # invoke X-13ARIMA-SEATS options as 'spec.argument' through the ... argument
##D # (consult the X-13ARIMA-SEATS manual for many more options and the list of
##D # R examples for more examples)
##D seas(AirPassengers, regression.aictest = c("td"))  # no easter testing
##D seas(AirPassengers, force.type = "denton")  # force equality of annual values
##D seas(AirPassengers, x11 = "")  # use x11, overrides the 'seats' spec
##D 
##D # 'spec.argument' combinations can also be supplied as a named list, which is
##D # useful for programming
##D seas(AirPassengers, list = list(regression.aictest = c("td"), outlier = NULL))
##D # constructing the list step by step
##D ll <- list()
##D ll[["x"]] <- AirPassengers
##D ll[["regression.aictest"]] <- "td"
##D ll["outlier"] <- list(NULL)  # assigning NULL to a list using single brackets
##D seas(list = ll)
##D 
##D # options can be entered as vectors
##D seas(AirPassengers, regression.variables = c("td1coef", "easter[1]"))
##D seas(AirPassengers, arima.model = c(0, 1, 1, 0, 1, 1))
##D seas(AirPassengers, arima.model = "(0 1 1)(0 1 1)")     # equivalent
##D 
##D # turn off the automatic procedures
##D seas(AirPassengers, regression.variables = c("td1coef", "easter[1]", 
##D "ao1951.May"), arima.model = "(0 1 1)(0 1 1)", regression.aictest = NULL, 
##D outlier = NULL, transform.function = "log")
##D 
##D # static replication of 'm <- seas(AirPassengers)'
##D static(m)  # this also tests the equivalence of the static call
##D static(m, test = FALSE)  # no testing (much faster)
##D static(m, coef = TRUE)  # also fixes the coefficients
##D 
##D # updating an existing model
##D update(m, x11 = "")
##D 
##D # specific extractor functions
##D final(m) 
##D predict(m)   # equivalent
##D original(m) 
##D resid(m) 
##D coef(m)
##D fivebestmdl(m)
##D out(m)                  # the X-13 .out file (see ?out, for details)
##D spc(m)                  # the .spc input file to X-13 (for debugging)
##D 
##D # universal extractor function for any X-13ARIMA-SEATS output (see ?series)
##D series(m, "forecast.forecasts")
##D 
##D # copying the output of X-13 to a user defined directory
##D seas(AirPassengers, dir = "~/mydir")
##D 
##D # user defined regressors (see ?genhol for more examples)
##D # a temporary level shift in R base
##D tls <- ts(0, start = 1949, end = 1965, freq = 12)
##D window(tls, start = c(1955, 1), end = c(1957, 12)) <- 1
##D seas(AirPassengers, xreg = tls, outlier = NULL)
##D # identical to a X-13ARIMA-SEATS specification of the the level shift
##D seas(AirPassengers, regression.variables = c("tl1955.01-1957.12"), 
##D      outlier = NULL)
##D 
##D # forecasting an annual series without seasonal adjustment
##D m <- seas(airmiles, seats = NULL, regression.aictest = NULL)
##D series(m, "forecast.forecasts")
##D 
##D # NA handling
##D AirPassengersNA <- window(AirPassengers, end = 1962, extend = TRUE)
##D final(seas(AirPassengersNA, na.action = na.omit))    # no NA in final series
##D final(seas(AirPassengersNA, na.action = na.exclude)) # NA in final series
##D # final(seas(AirPassengersNA, na.action = na.fail))    # fails
##D 
##D # NA handling by X-13 (works with internal NAs)
##D AirPassengersNA[20] <- NA 
##D final(seas(AirPassengersNA, na.action = na.x13))
##D 
##D ## performing 'composite' adjustment
##D m.direct <- seas(ldeaths, x11 = "")
##D final.direct <- final(m.direct)
##D m.indirect <- lapply(list(mdeaths, fdeaths), seas, x11 = "")
##D 
##D  # not very efficient, but keeps time series properties
##D final.indirect <- Reduce(`+`, lapply(m.indirect, final)) 
##D 
##D ts.plot(cbind(final.indirect, final(m.direct)), col = 1:2)
##D legend("topright", legend = c("disagregated", "aggregated"), lty = 1, col = 1:2)
##D 
## End(Not run)




