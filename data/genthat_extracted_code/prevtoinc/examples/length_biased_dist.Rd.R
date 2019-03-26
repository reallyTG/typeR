library(prevtoinc)


### Name: length_biased_dist
### Title: Calculate length-biased distribution from discrete
###   length-unbiased distribution starting at 1
### Aliases: length_biased_dist

### ** Examples


# geometric distribution starting in 1 and cutoff at 70 with mean at about 8.
geom.dist <- create_dist_vec(geom_dist_fct, max.dist = 70)
# calculate mean
sum(1:length(geom.dist)*geom.dist)
# plot original distribution
plot(geom.dist)
geom.dist.lb <- length_biased_dist(geom.dist)
# plot length biased distribution
plot(geom.dist.lb)




