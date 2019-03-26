library(dispRity)


### Name: extinction.subsets
### Title: Getting the time subsets from at and after an extinction event
### Aliases: extinction.subsets

### ** Examples

## Loading some disparity data
data(disparity)

## Time subsets for the K-Pg extinction (66 Mya)
extinction.subsets(disparity, 66, names = TRUE)

## Extinction with a lag effect of 3 slices
extinction_time <- extinction.subsets(disparity, 66, lag = 3, as.list = TRUE)

## Testing the extinction effect with a lag
test.dispRity(disparity, wilcox.test, comparisons = extinction_time,
              correction = "bonferroni")




