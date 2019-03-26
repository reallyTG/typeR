library(gapfill)


### Name: EstimateQuantile
### Title: Estimate the Quantile of a Missing Value
### Aliases: EstimateQuantile

### ** Examples

a <- Subset(data = ndvi, mp = c(1, 3, 1, 2), i = 0)
EstimateQuantile(a = a, mp = attr(a, "mp"), nQuant = 2)




