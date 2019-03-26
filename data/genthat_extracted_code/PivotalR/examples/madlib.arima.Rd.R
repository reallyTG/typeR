library(PivotalR)


### Name: madlib.arima
### Title: Wrapper for MADlib's ARIMA model fitting function
### Aliases: madlib.arima madlib.arima,db.Rquery,db.Rquery-method
###   madlib.arima,formula,db.obj-method
### Keywords: madlib stats

### ** Examples

## Not run: 
##D library(PivotalR)
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## use double values as the time stamp
##D ## Any values that can be ordered will work
##D example_time_series <- data.frame(id =
##D                        seq(0,1000,length.out=length(ts)),
##D                        val = arima.sim(list(order=c(2,0,1), ar=c(0.7,
##D                              -0.3), ma=0.2), n=1000000) + 3.2)
##D 
##D x <- as.db.data.frame(example_time_series, field.types = list(id="double
##D      precision", val = "double precision"), conn.id = cid)
##D 
##D dim(x)
##D 
##D names(x)
##D 
##D ## use formula
##D s <- madlib.arima(val ~ id, x, order = c(2,0,1))
##D 
##D s
##D 
##D ## delete s and the 3 tables: model, residuals and statistics
##D delete(s)
##D 
##D s # s does not exist any more
##D 
##D ## do not use formula
##D s <- madlib.arima(x$val, x$id, order = c(2,0,1))
##D 
##D s
##D 
##D lookat(sort(s$residuals, F, s$residuals$tstamp), 10)
##D 
##D lookat(s$model)
##D 
##D lookat(s$statistics)
##D 
##D ## 10 forecasts
##D pred <- predict(s, n.ahead = 10)
##D 
##D lookat(sort(pred, F, pred$step_ahead), "all")
##D 
##D ## Use expressions
##D s <- madlib.arima(val+2 ~ I(id + 1), x, order = c(2,0,1))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



