library(dispRity)


### Name: dispRity.through.time
### Title: Disparity through time.
### Aliases: dispRity.through.time

### ** Examples

## Load the Beck & Lee 2014 data
data(BeckLee_mat50) ; data(BeckLee_tree)

## Run a simple disparity through time analysis (with three time bins)
result <- dispRity.through.time(BeckLee_mat50, BeckLee_tree, 3)
summary(result) ; plot(result)




