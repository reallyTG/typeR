library(FitAR)


### Name: glog
### Title: glog transformation
### Aliases: glog
### Keywords: manip

### ** Examples

#usual log transformation doesn't work
all(is.finite(log(sunspot.month)))
#either shifted log
all(is.finite(log(sunspot.month+1)))
#or glog works
all(is.finite(glog(sunspot.month)))
#but glog may be better, especially for values <1 but >=0



