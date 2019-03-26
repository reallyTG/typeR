library(strat)


### Name: srank
### Title: Ranking strata.
### Aliases: srank

### ** Examples

strata_info <- with(cpsmarch2015, srank(income, big_class,
 weights = weight, group = education))
print(strata_info, digits = 3)



