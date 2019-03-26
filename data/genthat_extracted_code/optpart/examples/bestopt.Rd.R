library(optpart)


### Name: bestopt
### Title: Best Of Set Optimal Partitions From Random Starts
### Aliases: bestopt
### Keywords: cluster

### ** Examples

data(shoshveg)
dis.bc <- dsvdis(shoshveg,'bray/curtis')
x <- bestopt(dis.bc,5,10)
summary(x)
## Not run: plot(x) 



