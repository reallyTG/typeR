library(SpatialExtremes)


### Name: lmadogram
### Title: Computes the lambda-madogram
### Aliases: lmadogram
### Keywords: hplot

### ** Examples

n.site <- 50
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0, range = 1,
smooth = 2)

##Compute the lambda-madogram
lmadogram(data, locations, n.bins = 80)



