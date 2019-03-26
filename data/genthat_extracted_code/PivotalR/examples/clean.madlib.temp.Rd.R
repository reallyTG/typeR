library(PivotalR)


### Name: clean.madlib.temp
### Title: Delete all the result tables created during calculations of
###   MADlib
### Aliases: clean.madlib.temp
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## use double values as the time stamp
##D ## Any values that can be ordered will work
##D example_time_series <- data.frame(
##D     id = seq(0,1000,length.out=length(ts)),
##D     val = arima.sim(list(order=c(2,0,1),
##D     ar=c(0.7, -0.3), ma=0.2), n=1000000) + 3.2)
##D 
##D x <- as.db.data.frame(example_time_series, field.types =
##D                       list(id="double precision", val = "double precision"),
##D                       conn.id = cid, verbose = FALSE)
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
##D ## delete all result tables
##D clean.madlib.temp(conn.id = 1)
##D 
##D ## s still exists but the 3 tables (model, residuals, etc.) are deleted
##D s
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



