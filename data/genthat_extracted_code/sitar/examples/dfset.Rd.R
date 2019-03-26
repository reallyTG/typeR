library(sitar)


### Name: dfset
### Title: Find degrees of freedom for a natural spline curve to minimise
###   BIC or AIC
### Aliases: dfset

### ** Examples

data(heights)
dfset(age, height, heights, FUN=BIC, plot=TRUE)
dfset(age, height, heights, FUN=function(a) AIC(a, k=1))



