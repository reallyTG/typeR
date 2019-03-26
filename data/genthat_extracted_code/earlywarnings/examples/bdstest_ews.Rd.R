library(earlywarnings)


### Name: bdstest_ews
### Title: Description: BDS test Early Warning Signals
### Aliases: bdstest_ews
### Keywords: early-warning

### ** Examples

#
data(foldbif)
bdstest_ews(foldbif,ARMAoptim=FALSE,ARMAorder=c(1,0),embdim=3,epsilon=0.5, 
boots=200,logtransform=FALSE,interpolate=FALSE)



