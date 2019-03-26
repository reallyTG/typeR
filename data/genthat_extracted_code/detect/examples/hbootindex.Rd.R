library(detect)


### Name: hbootindex
### Title: Hierarchical bootstrap indices
### Aliases: hbootindex
### Keywords: utils

### ** Examples

## equal group sizes
groups <- rep(1:4, each=5)
strata <- rep(1:2, each=10)
hbootindex(groups, strata, 3)

## unequal group sizes
groups <- groups[-c(5,9,10,11)]
strata <- strata[-c(5,9,10,11)]
hbootindex(groups, strata, 3)



