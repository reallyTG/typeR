library(dispRity)


### Name: get.bin.ages
### Title: Get time bins ages
### Aliases: get.bin.ages

### ** Examples

## Loading the data
data(BeckLee_tree)
data(BeckLee_mat50)

## Getting the stratigraphic data
stratigraphy <- get.bin.ages(BeckLee_tree)

## Making stratigraphic time subsets
chrono.subsets(BeckLee_mat50, tree = BeckLee_tree, method = "discrete",
                time = stratigraphy)




