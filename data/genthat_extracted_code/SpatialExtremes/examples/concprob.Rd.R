library(SpatialExtremes)


### Name: concprob
### Title: Pairwise empirical and extremal concurrence probabilities
### Aliases: concprob
### Keywords: hplot

### ** Examples

n.site <- 25
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
n.obs <- 100
data <- rmaxstab(n.obs, locations, cov.mod = "whitmat", nugget = 0, range = 1,
smooth = 1.75)

##Compute the F-madogram
concprob(data, locations)

##Compare the F-madogram with a fitted max-stable process
fitted <- fitmaxstab(data, locations, "whitmat", nugget = 0)
concprob(fitted = fitted)



