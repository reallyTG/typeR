library(GAS)


### Name: distributions
### Title: Distributions of the GAS package
### Aliases: distributions ddist_Uni ddist_Multi pdist_Uni qdist_Uni
###   rdist_Uni mdist_Uni Score_Uni Quantiles Score_Multi rmvt_mat IM_Uni
###   rdist_Multi

### ** Examples

# Skew Student-t distribution

# log density
Theta = c("location" = 0, "scales" = 1, "skewness" = 1.2, "shape" = 7)

ddist_Uni(y = 0.5, Theta, "sstd", TRUE)

# probability
pdist_Uni(q = -1.69, Theta, "sstd")

#quantile
qdist_Uni(p = 0.05, Theta, "sstd")

#random generator
rdist_Uni(Theta, "sstd")

#moments
mdist_Uni(Theta, "sstd")



