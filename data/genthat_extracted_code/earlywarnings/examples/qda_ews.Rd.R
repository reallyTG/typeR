library(earlywarnings)


### Name: qda_ews
### Title: Description: Quick Detection Analysis for Generic Early Warning
###   Signals
### Aliases: qda_ews
### Keywords: early-warning

### ** Examples

data(foldbif)
out <- qda_ews(foldbif, param = NULL, winsize = 50, detrending='gaussian', bandwidth=NULL, 
boots = 50, s_level = 0.05, cutoff=0.05, detection.threshold = 0.002, grid.size = 50, 
logtransform=FALSE, interpolate=FALSE)



