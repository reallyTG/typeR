library(strat)


### Name: strat
### Title: Stratification index.
### Aliases: strat

### ** Examples

s <- with(cpsmarch2015, strat(income, big_class,
 weights = weight, group = education))
print(s, digits = 4)
print(s$strata_info, digits = 4)
print(s$within_group, digits = 4)



