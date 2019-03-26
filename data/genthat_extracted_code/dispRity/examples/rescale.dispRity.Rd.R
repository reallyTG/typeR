library(dispRity)


### Name: rescale.dispRity
### Title: Rescaling and centering disparity results.
### Aliases: rescale.dispRity

### ** Examples

## Load the disparity data based on Beck & Lee 2014
data(disparity)

## Scaling the data
summary(disparity) # No scaling
summary(rescale.dispRity(disparity)) # Dividing by the maximum
## Multiplying by 10 (dividing by 0.1)
summary(rescale.dispRity(disparity, max = 0.1))




