library(agridat)


### Name: williams.trees
### Title: Height / Survival of 37 tree species at six sites in Thailand
### Aliases: williams.trees

### ** Examples


data(williams.trees)
dat <- williams.trees

require(lattice)
xyplot(survival~height|env,dat, main="williams.trees", xlab="Height",
ylab="Percent surviving")



