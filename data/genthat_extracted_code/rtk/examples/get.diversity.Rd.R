library(rtk)


### Name: get.diversity
### Title: get.diversity
### Aliases: get.diversity get.mean.diversity get.median.diversity

### ** Examples

require("rtk")
# Collectors Curve dataset should be broad and contain many samples (columns)
data            <- matrix(sample(x = c(rep(0, 15000), rep(1:10, 100)),
                          size = 10000, replace = TRUE), ncol = 80)
data.r 			<- rtk(data, depth = min(colSums(data)))
get.diversity(data.r)
get.median.diversity(data.r)
get.mean.diversity(data.r)



