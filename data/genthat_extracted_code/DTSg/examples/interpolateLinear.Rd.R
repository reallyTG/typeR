library(DTSg)


### Name: interpolateLinear
### Title: Linear Interpolation
### Aliases: interpolateLinear

### ** Examples

# new DTSg object
x <- DTSg$new(values = flow)

# linear interpolation of missing values
## R6 method
x$colapply(fun = interpolateLinear)

## S3 method
colapply(x = x, fun = interpolateLinear)




