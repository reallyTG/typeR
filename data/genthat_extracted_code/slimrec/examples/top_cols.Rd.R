library(slimrec)


### Name: top_cols
### Title: top_cols
### Aliases: top_cols

### ** Examples

## Not run: 
##D temp <- slim(mat           = ft_implicit # input sparse ratings matrix
##D              , alpha       = 0.5         # 0 for ridge, 1 for lasso
##D              #, lambda                   # suggested not to set lambda
##D              #, nlambda                  # using default nlambda = 100
##D              , nonNegCoeff = TRUE        # better accuracy, lower interpretability
##D              , directory   = td          # dir where output matrices are stored
##D              , coeffMat    = TRUE        # helpful in 'predict'ing later
##D              , returnMat   = TRUE        # return matrices in memory
##D              , computeRMSE = TRUE        # RMSE over rated items
##D              , nproc       = 2L          # number of concurrent processes
##D              , progress    = TRUE        # show a progressbar
##D              , check       = TRUE        # do basic checks on input params
##D              , cleanup     = FALSE       # keep output matrices on disk
##D              )
##D str(temp)
##D # output ratings matrix would be comparatively denser
##D predMat <- temp[["ratingMat"]] != 0
##D sum(predMat)/((dim(predMat)[1])*(dim(predMat)[2]))
##D # recommend top 5 items for a user 10
##D top_cols(temp[["ratingMat"]]
##D          , row = 10
##D          , k   = 5
##D          )
##D # if you intend to avoid recommending 10, 215 and 3
##D top_cols(temp[["ratingMat"]]
##D          , row = 10
##D          , k   = 5
##D          , ignore = c(10, 215, 3)
##D          )
## End(Not run)




