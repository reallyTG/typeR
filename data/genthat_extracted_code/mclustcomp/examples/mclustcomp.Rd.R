library(mclustcomp)


### Name: mclustcomp
### Title: Measures for Comparing Clusterings
### Aliases: mclustcomp

### ** Examples

## example 1. compare two identical clusterings
x = sample(1:5,20,replace=TRUE) # label from 1 to 5, 10 elements
y = x                           # set two labels x and y equal
mclustcomp(x,y)                 # show all results

## example 2. selection of a few methods
z = sample(1:4,20,replace=TRUE)           # generate a non-trivial clustering
cmethods = c("jaccard","tanimoto","rand") # select 3 methods
mclustcomp(x,z,types=cmethods)            # test with the selected scores

## example 3. tversky.param
tparam = list()                           # create an empty list
tparam$alpha = 2
tparam$beta  = 3
tparam$sym   = TRUE
mclustcomp(x,z,types="tversky")           # default set as Tanimoto case.
mclustcomp(x,z,types="tversky",tversky.param=tparam)





