library(adehabitatLT)


### Name: sliwinltr
### Title: Apply a Function on an Object of Class "ltraj", Using a Sliding
###   Window
### Aliases: sliwinltr
### Keywords: hplot

### ** Examples

## Not run: 
##D data(capreotf)
##D 
##D ## computes the average speed of the roe deer in a moving window of width
##D ## equal to 60 minutes
##D toto <- sliwinltr(capreotf, function(x) mean(x$dist/x$dt, na.rm = TRUE),
##D                   step = 30, type = "time", units = "min")
##D 
##D ## zoom before the peak
##D head(toto[[1]])
##D plot(toto[[1]][1:538,], ty="l")
## End(Not run)



