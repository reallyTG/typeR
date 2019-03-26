library(TSstudio)


### Name: ts_sum
### Title: Summation of Multiple Time Series Object
### Aliases: ts_sum

### ** Examples


x <- matrix(c(1:100, 1:100, 1:100), ncol = 3)
mts.obj <- ts(x, start = c(2000, 1), frequency = 12)
ts_total <- ts_sum(mts.obj)




