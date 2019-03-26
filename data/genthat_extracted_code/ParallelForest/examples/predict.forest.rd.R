library(ParallelForest)


### Name: predict.forest
### Title: Predict method for random decision forest classifier fits
### Aliases: predict.forest predict.tree predict,forest-method
###   predict,tree-method

### ** Examples

  data(easy_2var_data)

  fforest = grow.forest(Y~X1+X2, data=easy_2var_data, 
    min_node_obs=5, max_depth=10,
    numsamps=90, numvars=1, numboots=5)

  xnew = data.frame(
    X1 = c(0.06, 0.05, 0.05, 0.01, 0.09, 0.05, 0.05,-1000, 1000),
    X2 = c(0.03, 0.02, 0.05, 0.03, 0.04,-1000, 1000, 0.04, 0.03)
    )

  fforest_ynewhat = predict(fforest, xnew)



