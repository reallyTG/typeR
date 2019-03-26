library(wux)


### Name: userinput_CMIP5_changesignal
### Title: Example userinput for models2wux
### Aliases: userinput_CMIP5_changesignal
### Keywords: datasets

### ** Examples

## thats what userinput_CMIP5_changesignal looks like:
## it contains a single list named user.input
## describing 2 CMIP5 models in the alpine region
data("userinput_CMIP5_changesignal")
is.list(userinput_CMIP5_changesignal)
str(userinput_CMIP5_changesignal)

data(modelinput_test)

## reading in these data and process them:
## Not run: 
##D wux.test <- models2wux(userinput_CMIP5_changesignal,
##D                                 modelinput = model.input)
## End(Not run)
## if you had a file "/tmp/userinput_CMIP5_changesignal.R" which contains a
## list 'user.input with the same content as 'userinput_CMIP5_changesignal'
## you could read the data also like this:
## Not run: 
##D wux.test <- models2wux("/tmp/userinput_CMIP5_changesignal.R",
##D                         modelinput = model.input)
## End(Not run)

## the result is what the data.set would look like, if you ran the code
## above:
data(CMIP5_example_changesignal)
wux.test <- CMIP5_example_changesignal
wux.test

## example summary though the statistics not make much sense with 2 models
summary(wux.test, parms = "delta.air_temperature")




