library(mlogitBMA)


### Name: summary.mnl.spec
### Title: Summary for a Specification Object
### Aliases: summary.mnl.spec
### Keywords: print

### ** Examples

data(heating)
spec <- mnl.spec(depvar ~ ic | oc, heating, varying=3:12, sep='')
summary(spec)



