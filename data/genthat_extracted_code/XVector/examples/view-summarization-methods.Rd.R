library(XVector)


### Name: view-summarization-methods
### Title: Summarize views on an XInteger or XDouble object
### Aliases: view-summarization-methods viewMins,XIntegerViews-method
###   viewMins,XDoubleViews-method viewMaxs,XIntegerViews-method
###   viewMaxs,XDoubleViews-method viewSums,XIntegerViews-method
###   viewSums,XDoubleViews-method viewMeans,XIntegerViews-method
###   viewMeans,XDoubleViews-method viewWhichMins,XIntegerViews-method
###   viewWhichMins,XDoubleViews-method viewWhichMaxs,XIntegerViews-method
###   viewWhichMaxs,XDoubleViews-method
### Keywords: methods arith

### ** Examples

set.seed(0)
vec <- sample(24)
vec_views <- slice(vec, lower=4, upper=16)
vec_views

viewApply(vec_views, function(x) diff(as.integer(x)))

viewMins(vec_views)
viewMaxs(vec_views)

viewSums(vec_views)
viewMeans(vec_views)

viewWhichMins(vec_views)
viewWhichMaxs(vec_views)



