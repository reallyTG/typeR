library(ReIns)


### Name: norwegianfire
### Title: Norwegian fire insurance data
### Aliases: norwegianfire
### Keywords: datasets

### ** Examples

data(norwegianfire)

# Exponential QQ-plot for Norwegian Fire Insurance data for claims in 1976.
ExpQQ(norwegianfire$size[norwegianfire$year==76])

# Pareto QQ-plot for Norwegian Fire Insurance data for claims in 1976.
ParetoQQ(norwegianfire$size[norwegianfire$year==76])



