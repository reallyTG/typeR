library(qcc)


### Name: stats.g
### Title: Statistics used in computing and drawing a Shewhart g chart
### Aliases: stats.g sd.g limits.g
### Keywords: hplot

### ** Examples

success <- rbinom(1000, 1, 0.01)
num.noevent <- diff(which(c(1,success)==1))-1
qcc(success, type = "np", sizes = 1)
qcc(num.noevent, type = "g")



