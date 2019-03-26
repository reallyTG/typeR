library(rtk)


### Name: rtk
### Title: Rarefy tables
### Aliases: rtk

### ** Examples

require("rtk")
# generate semi sparse example data
data            <- matrix(sample(x = c(rep(0, 1500),rep(1:10, 500),1:1000),
                          size = 120, replace = TRUE), 10)
# find the column with the lowest aboundance
samplesize      <- min(colSums(data))
# rarefy the dataset, so each column contains the same number of samples
data.rarefied   <- rtk(input = data, depth = samplesize, ReturnMatrix = 1)

richness   <- get.diversity(data.rarefied, div = "richness")
eveness    <- get.diversity(data.rarefied, div = "eveness")




