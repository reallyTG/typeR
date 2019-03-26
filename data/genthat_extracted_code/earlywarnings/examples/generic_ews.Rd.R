library(earlywarnings)


### Name: generic_ews
### Title: Description: Generic Early Warning Signals
### Aliases: generic_ews
### Keywords: early-warning

### ** Examples

data(foldbif)
out=generic_ews(foldbif,winsize=50,detrending='gaussian',
bandwidth=5,logtransform=FALSE,interpolate=FALSE)



