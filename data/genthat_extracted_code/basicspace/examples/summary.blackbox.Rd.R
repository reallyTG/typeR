library(basicspace)


### Name: summary.blackbox
### Title: Blackbox Summary
### Aliases: summary.blackbox
### Keywords: multivariate

### ** Examples

### Loads issue scales from the 1980 NES.
data(Issues1980)
Issues1980[Issues1980[,"abortion1"]==7,"abortion1"] <- 8	#missing recode
Issues1980[Issues1980[,"abortion2"]==7,"abortion2"] <- 8	#missing recode

### This command conducts estimates, which we instead load using data()
# Issues1980_bb <- blackbox(Issues1980,missing=c(0,8,9),verbose=FALSE,dims=3,minscale=8)
data(Issues1980_bb)

summary(Issues1980_bb)



