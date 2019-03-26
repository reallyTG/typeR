library(ParallelForest)


### Name: grow.forest
### Title: Growing random decision forest classifier
### Aliases: grow.forest

### ** Examples

  data(easy_2var_data)
  
  fforest = grow.forest(Y~X1+X2, data=easy_2var_data, 
    min_node_obs=5, max_depth=10,
    numsamps=90, numvars=1, numboots=5)



