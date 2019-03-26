library(iNEXT)


### Name: estimateD
### Title: Compute species diversity with a particular of sample
###   size/coverage
### Aliases: estimateD

### ** Examples

data(spider)
estimateD(spider, "abundance", base="size", level=NULL, conf=0.95)
estimateD(spider, "abundance", base="coverage", level=NULL, conf=0.95)

data(ant)
estimateD(ant, "incidence_freq", base="coverage", level=0.985, conf=NULL)



