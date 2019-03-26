library(robfilter)


### Name: scarm.filter
### Title: SCARM (Slope Comparing Adaptive Repeated Median)
### Aliases: scarm.filter
### Keywords: robust smooth ts

### ** Examples

# Time series
data(multi.ts)
x <- multi.ts[,1]

# apply SCARM Filter 
scarm.extr <- scarm.filter(x)
plot(scarm.extr)



