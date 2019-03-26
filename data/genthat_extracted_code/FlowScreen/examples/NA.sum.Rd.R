library(FlowScreen)


### Name: NA.sum
### Title: Sum missing data points from a daily time series
### Aliases: NA.sum

### ** Examples

data(caniapiscau)
cania.sub <- caniapiscau[300:1200,]
cania.ts <- create.ts(cania.sub)
res <- NA.runs(cania.ts)
res2 <- NA.sum(res)



