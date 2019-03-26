library(imptree)


### Name: imptree_control
### Title: Control parameters for generating imptree objects
### Aliases: imptree_control
### Keywords: tree

### ** Examples

## Check performed for splitmetric 'globalmax',
## tbase' is default generated and 'gamma' is overwritten
## (see Details), tree is grown to full depth and 
## at least 5 observations are needed to be within each node
imptree_control(splitmetric = 0, gamma = 0.5,
                depth = NULL, minbucket = 5)

## Passing some control arguments in a list
## As splitmetric is 'range', gamma is respected
imptree_control(splitmetric = 1, minbucket = 5,
                controlList = list(gamma = 0.5, depth = NULL))




