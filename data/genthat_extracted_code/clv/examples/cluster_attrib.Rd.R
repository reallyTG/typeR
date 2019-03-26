library(clv)


### Name: cls.attrib
### Title: Mean, cluster size and center - cluster utilities
### Aliases: cls.attrib
### Keywords: cluster

### ** Examples

# create "data" matrix
mx <- matrix(0,4,2)
mx[2,1] = mx[3,2] = mx[4,1] = mx[4,2] = 1
# give information about cluster assignment
clust = as.integer(c(1,1,2,2))
cls.attrib(mx,clust)



