library(FlowScreen)


### Name: NA.runs
### Title: Missing data runs for daily time series.
### Aliases: NA.runs

### ** Examples

data(caniapiscau)
cania.sub <- caniapiscau[300:1200,]
cania.ts <- create.ts(cania.sub)
res <- NA.runs(cania.ts)



