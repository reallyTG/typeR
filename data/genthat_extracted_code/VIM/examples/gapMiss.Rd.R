library(VIM)


### Name: gapMiss
### Title: Missing value gap statistics
### Aliases: gapMiss
### Keywords: manip

### ** Examples

v <- rnorm(20)
v[3] <- NA
v[6:9] <- NA
v[13:17] <- NA
v
gapMiss(v)
gapMiss(v, what = median)
gapMiss(v, what = function(x) mean(x, trim = 0.1))
gapMiss(v, what = var)



