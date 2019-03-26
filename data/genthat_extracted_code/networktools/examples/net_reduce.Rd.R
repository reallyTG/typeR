library(networktools)


### Name: net_reduce
### Title: net_reduce
### Aliases: net_reduce

### ** Examples

## No test: 
gb_depression <- goldbricker(depression, threshold=0.5)

reduced_depression_PCA <- net_reduce(data=depression, badpairs=gb_depression)
reduced_depression_best <- net_reduce(data=depression,
                           badpairs=gb_depression, method="best_goldbricker")

## End(No test)




