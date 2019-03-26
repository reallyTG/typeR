library(prevtoinc)


### Name: length_unbiased_mean
### Title: Calculate mean of length-unbiased distribution from discrete
###   length-biased distribution starting at 1
### Aliases: length_unbiased_mean

### ** Examples


# geometric distribution starting in 1 and cutoff at 70 with mean at about 8.
geom.dist <- create_dist_vec(geom_dist_fct, max.dist = 70)
# calculate mean of distribution
sum(1:length(geom.dist)*geom.dist)
# create length-biased distribution in same format
geom.dist.lb <- length_biased_dist(geom.dist)

# recalculate mean of original distribution based on length-biased distribution
length_unbiased_mean(geom.dist.lb)




