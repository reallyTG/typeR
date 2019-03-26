library(VIM)


### Name: aggr
### Title: Aggregations for missing/imputed values
### Aliases: aggr plot.aggr print.aggr summary.aggr
### Keywords: hplot print

### ** Examples


data(sleep, package="VIM")
## for missing values
a <- aggr(sleep)
a
summary(a)

## for imputed values
sleep_IMPUTED <- kNN(sleep)
a <- aggr(sleep_IMPUTED, delimiter="_imp")
a
summary(a)


data(sleep, package = "VIM")
a <- aggr(sleep, plot=FALSE)
a


data(sleep, package = "VIM")
summary(aggr(sleep, plot=FALSE))




