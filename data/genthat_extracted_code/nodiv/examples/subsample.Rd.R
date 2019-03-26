library(nodiv)


### Name: subsample
### Title: Subsampling data objects to certain species or sites
### Aliases: subsample subsample.distrib_data subsample.nodiv_data
###   subsample.nodiv_result
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(coquettes)
new <- subsample(coquettes, sites = which(richness(coquettes) > 3))
plot(new, show.tip = FALSE)



