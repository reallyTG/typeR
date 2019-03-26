library(ffbase)


### Name: within.ffdf
### Title: Evaluate an expression in a ffdf data environment
### Aliases: within.ffdf

### ** Examples


ffdat <- as.ffdf(data.frame(x=1:10, y=10:1))
# add z to the ffdat
within(ffdat, {z <- x+y})



