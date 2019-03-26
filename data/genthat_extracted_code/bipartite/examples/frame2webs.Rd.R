library(bipartite)


### Name: frame2webs
### Title: Converts a table of observations into a network matrix
### Aliases: frame2webs
### Keywords: package

### ** Examples

testdata <- data.frame(higher = c("bee1","bee1","bee1","bee2","bee1","bee3"), 
lower = c("plant1","plant2","plant1","plant2","plant3","plant4"), 
webID = c("meadow","meadow","meadow","meadow","bog","bog"), freq=c(5,1,1,1,3,7))
frame2webs(testdata,type.out="array")
sapply(frame2webs(testdata,type.out="list"), networklevel, index=c("connectance", "C score"))



