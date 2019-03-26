library(actuar)


### Name: quantile.grouped.data
### Title: Quantiles of Grouped Data
### Aliases: quantile.grouped.data
### Keywords: univar

### ** Examples

data(gdental)
quantile(gdental)
Fn <- ogive(gdental)
Fn(quantile(gdental))		# inverse function



