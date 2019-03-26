library(FlowScreen)


### Name: create.ts
### Title: Create a Time Series of daily streamflow observations
### Aliases: create.ts

### ** Examples

data(caniapiscau)
# subset flow series for shorter example run time
caniapiscau.sub <- caniapiscau[300:1800,]
caniapiscau.sub.ts <- create.ts(caniapiscau.sub)



