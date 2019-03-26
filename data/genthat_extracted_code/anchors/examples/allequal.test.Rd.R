library(anchors)


### Name: allequal.test
### Title: all.equal with expected outcome test
### Aliases: allequal.test
### Keywords: utilities

### ** Examples


a <- c(1:5)
b <- a+1

allequal.test(a,a,expect=TRUE)
allequal.test(a,b,expect=FALSE)
## these throw stop() but here we wrap in try() for example usage
try(allequal.test(a,a,expect=FALSE))
try(allequal.test(a,b,expect=TRUE))




