library(prevtoinc)


### Name: A_to_X_dist
### Title: function to transform the distribution of stays to a fixed point
###   to the distribution of the staying times
### Aliases: A_to_X_dist

### ** Examples


# generate vector of probabilities for truncated Poisson distribution for 
# distribution of times of stay X
dist.X <- dpois(1:70, 4)
plot(dist.X)
# transform to distribution of distribution of staying-time up to observation point under
# assumption of steady state
dist.A <- X_to_A_dist(dist.X)
plot(dist.A)
# transform back to get original distribution
dist.X.2 <- A_to_X_dist(dist.A)
plot(dist.X.2)




