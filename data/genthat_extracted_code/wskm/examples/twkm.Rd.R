library(wskm)


### Name: twkm
### Title: Two-level variable weighting clustering
### Aliases: twkm
### Keywords: variable weighting

### ** Examples


# The data twkm.sample has 2000 objects and 410 variables.
# Scale the data before clustering
x <- scale(twkm.sample[,1:409])

# Group information is formated as below.
# Each group is separated by ';'.
strGroup <- "0-75;76-291;292-355;356-402;403-408"
groups <- c(rep(0, abs(0-75-1)), rep(1, abs(76-291-1)), rep(2, abs(292-355-1)),
            rep(3, abs(356-402-1)), rep(4, abs(403-408-1)))

## No test: 
# Use the twkm algorithm.
mytwkm <- twkm(x, 10, strGroup, 3, 1, seed=19)
mytwkm2 <- twkm(x, 10, groups, 3, 1, seed=19)
all.equal(mytwkm, mytwkm2)

# You can print the clustering result now.
mytwkm$cluster
mytwkm$featureWeight
mytwkm$groupWeight
mytwkm$iterations
mytwkm$restarts
mytwkm$totiters
mytwkm$totss

# Use a cluster validation method from package 'clv'.

# real.cluster is the real class label of the data 'twkm.sample'.
real.cluster <- twkm.sample[,410]

# std.ext() returns four values SS, SD, DS, DD.
std <- std.ext(as.integer(mytwkm$cluster), real.cluster)

# Rand index 
clv.Rand(std)

# Jaccard coefficient
clv.Jaccard(std)
## End(No test)




