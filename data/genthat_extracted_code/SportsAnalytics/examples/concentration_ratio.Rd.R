library(SportsAnalytics)


### Name: concentration_ratio
### Title: Concentration ratios
### Aliases: concentration_ratio

### ** Examples

set.seed(1234)
x <- sample(100000, 10)  # Data
o <- sample(10)          # Exogenous order

concentration_ratio(x, 3)
concentration_ratio(x, 3, ex = o)



