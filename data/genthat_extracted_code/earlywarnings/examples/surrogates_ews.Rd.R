library(earlywarnings)


### Name: surrogates_ews
### Title: Description: Surrogates Early Warning Signals
### Aliases: surrogates_ews
### Keywords: early-warning

### ** Examples

data(foldbif)
output=surrogates_ews(foldbif,indicator='sd',winsize=50,detrending='gaussian',
bandwidth=10,boots=200,logtransform=FALSE,interpolate=FALSE)



