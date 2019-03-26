library(wux)


### Name: CMIP5_example_changesignal
### Title: Climate change signals of example userinput for models2wux
### Aliases: CMIP5_example_changesignal
### Keywords: datasets

### ** Examples

## thats what CMIP5_changesignal looks like
data("CMIP5_example_changesignal")
CMIP5_example_changesignal

## You can run models2wux to get the same result as
## above.
data(userinput_CMIP5_changesignal)
data(modelinput_test)
## Not run: 
##D ## You must have downloaded the example NetCDF files according to
##D ## "modelinput_test" in order to run "models2wux", or you will get an
##D error message. See the examples of ?CMIP5fromESGF or ?modelinput_test.  
##D CMIP5_example_changesignal <- models2wux(userinput_CMIP5_changesignal,
##D                                 modelinput = modelinput_test)
## End(Not run)




