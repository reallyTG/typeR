library(KnowGRRF)


### Name: get.performance
### Title: Get performance of feature selection
### Aliases: get.performance

### ** Examples

set.truth=1:10  ##true important feature from ground truth
set.sel=c(8:10, 95)  ##selected feature by an algorithm
set.all=1:100  ##all candidate features

get.performance(set.truth, set.sel, set.all)





