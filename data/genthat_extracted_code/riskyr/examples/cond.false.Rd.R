library(riskyr)


### Name: cond.false
### Title: Number of individuals for which the condition is false.
### Aliases: cond.false
### Keywords: datasets

### ** Examples

cond.false <- 1000 * .90  # => sets cond.false to 90% of 1000 = 900 cases.
is_freq(cond.false)       # => TRUE
is_prob(cond.false)       # => FALSE, as cond.false is no probability [but (1 - prev) and spec are]



