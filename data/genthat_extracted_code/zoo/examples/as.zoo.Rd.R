library(zoo)


### Name: as.zoo
### Title: Coercion from and to zoo
### Aliases: as.zoo as.zoo.default as.zoo.data.frame as.zoo.fts as.zoo.its
###   as.zoo.irts as.zoo.matrix as.zoo.mcmc as.zoo.tis as.zoo.xts
###   as.zoo.zoo as.matrix.zoo as.vector.zoo as.data.frame.zoo as.list.zoo
###   as.list.ts as.zoo.ts as.ts.zoo
### Keywords: ts

### ** Examples

## coercion to zoo:
## default method
as.zoo(rnorm(5))
## method for "ts" objects
as.zoo(ts(rnorm(5), start = 1981, freq = 12))

## coercion from zoo:
x.date <- as.POSIXct(paste("2003-", rep(1:4, 4:1), "-", sample(1:28, 10, replace = TRUE), sep = ""))
x <- zoo(matrix(rnorm(24), ncol = 2), x.date)
as.matrix(x)
as.vector(x)
as.data.frame(x)
as.list(x)



