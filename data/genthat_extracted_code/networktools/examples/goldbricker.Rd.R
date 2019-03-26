library(networktools)


### Name: goldbricker
### Title: Goldbricker - Identifying redundant nodes in networks using
###   compared correlations
### Aliases: goldbricker

### ** Examples

## No test: 
gb_depression <- goldbricker(depression, threshold=0.5)

reduced_depression <- net_reduce(data=depression, badpairs=gb_depression)

## Set a new threshold quickly
gb_depression_60 <- goldbricker(data=gb_depression, threshold=0.6)

## End(No test)



