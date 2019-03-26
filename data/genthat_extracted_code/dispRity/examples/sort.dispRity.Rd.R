library(dispRity)


### Name: sort.dispRity
### Title: Sorting or ordering a 'dispRity' object.
### Aliases: sort.dispRity

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## Sorting the data
summary(disparity)
summary(sort(disparity, decreasing = TRUE))
summary(sort(disparity, sort = c(7,1,3,4,5,2,6)))




