library(dispRity)


### Name: summary.dispRity
### Title: dispRity object summary
### Aliases: summary.dispRity

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## Summarising the results
summary(disparity) # default
## Using different options
summary(disparity, quantiles = 75, cent.tend = mean, digits = 8,
     recall = TRUE)




