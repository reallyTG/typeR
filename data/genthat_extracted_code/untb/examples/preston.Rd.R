library(untb)


### Name: preston
### Title: Preston diagram of an ecosystem
### Aliases: preston Preston
### Keywords: math

### ** Examples

preston(untb(start=rep(1,100), prob=0.01, gens=1000, keep=FALSE))

data(butterflies)
preston(butterflies)
preston(butterflies,original=TRUE)

data(copepod)
preston(copepod)



