library(miWQS)


### Name: make.quantile.matrix
### Title: Accessory WQS Function: Making Quantiles of Correlated Index
### Aliases: make.quantile.matrix
### Keywords: wqs

### ** Examples

#Example 1: Make quantiles for first nine chemicals using complete chemical data
data(simdata87)
q <- make.quantile.matrix( simdata87$X.true[ , 1:9], 4)
summary(q)

#Example 2: Place missing values of first nine chemicals in first quantiles
q2 <- make.quantile.matrix( simdata87$X.bdl[  , 1:9], 4, verbose = TRUE)
summary(q2)




