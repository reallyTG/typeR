library(learningCurve)


### Name: delta
### Title: Crawford vs. Wright Unit Difference
### Aliases: delta

### ** Examples

# The first unit of production is expected to require 50 hours and
# the learning rate is expected to be 88.5%. However, the estimator
# is not sure whether the learning rate is based on the unit model
# or cumulative average model and wants to understand the difference
# between potential outcomes for each unit.

# differences between per unit time requirements
delta(t = 50, m = 1, n = 25, r = .885)
## [1] 0.000000 5.750000 6.103821 6.110519 6.041146 5.953271 5.863560 5.777401 5.696436
## [10] 5.620942 5.550687 5.485263 5.424223 5.367136 5.313606 5.263280 5.215844 5.171025
## [19] 5.128579 5.088293 5.049980 5.013473 4.978624 4.945304 4.913395

# differences between cumulative unit time requirements
delta(t = 50, m = 1, n = 25, r = .885, level = "c")
## [1]   0.00000   5.75000  11.85382  17.96434  24.00549  29.95876  35.82232  41.59972
## [9]  47.29615  52.91710  58.46778  63.95305  69.37727  74.74440  80.05801  85.32129
## [17]  90.53713  95.70816 100.83674 105.92503 110.97501 115.98848 120.96711 125.91241
## [25] 130.82581




