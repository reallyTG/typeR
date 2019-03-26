library(optimus)


### Name: get_characteristic
### Title: Determine the characteristic variables (e.g. species) of a
###   clustering solution (e.g. classification)
### Aliases: get_characteristic
### Keywords: characteristic, diagnostic, indicator

### ** Examples


## Prep the 'swamps' data
## ======================

data(swamps) # see ?swamps
swamps <- swamps[,-1]

## Find characteristic species in a classification of the swamps data
## ==================================================================

## perhaps not the best clustering option, but this is base R
swamps_hclust <- hclust(d = dist(x = log1p(swamps), method = "canberra"),
                       method = "complete")

# calculate per cluster characteristic species
swamps_char <- get_characteristic(data = swamps,
clustering = cutree(tree = swamps_hclust, k = 10), family = "poisson",
type = "per.cluster")

# look at the top 10 characteristic species for cluster 1
head(swamps_char[[1]], 10)

# calculate global characteristic species
swamps_char <- get_characteristic(data = swamps,
clustering = cutree(tree = swamps_hclust, k = 10), family = "poisson",
type = "global")

# top 10 characteristic species for the whole classification
head(swamps_char, 10)

## See vignette for more explanation than this example
## ============================================================




