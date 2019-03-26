library(wux)


### Name: userinput_CMIP5_timeseries
### Title: Example userinput for models2wux
### Aliases: userinput_CMIP5_timeseries
### Keywords: datasets

### ** Examples

## thats what userinput_CMIP5_timeseries looks like:
## it contains a single list named user.input
## describing 2 CMIP5 models in the alpine region
data("userinput_CMIP5_timeseries")
is.list(userinput_CMIP5_timeseries)
str(userinput_CMIP5_timeseries)

data(modelinput_test)

## reading in these data and process them:
## Not run: 
##D wux.test <- models2wux(userinput_CMIP5_timeseries,
##D                                 modelinput = model.input)
## End(Not run)
## if you had a file "/tmp/userinput_CMIP5_timeseries.R" which contains a
## list 'user.input with the same content as 'userinput_CMIP5_timeseries'
## you could read the data also like this:
## Not run: 
##D wux.test <- models2wux("/tmp/userinput_CMIP5_timeseries.R",
##D                         modelinput = model.input)
## End(Not run)

## the result is what the data.set would look like, if you ran the code
## above:
data(CMIP5_example_timeseries)
wux.test <- CMIP5_example_timeseries

## Not run: 
##D require(lattice)
##D xyplot(air_temperature ~ year|season,
##D        groups=acronym,
##D        data = wux.test,
##D        type = c("l", "g"),
##D        main = "Temperature trends for Alpine Region" )
## End(Not run)



