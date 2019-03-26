library(sRDA)


### Name: sRDA
### Title: sRDA.
### Aliases: sRDA sRDA-package sRDA
### Keywords: RDA Redundancy

### ** Examples

# generate data with few highly correlated variahbles
dataXY <- generate_data(nr_LVs = 2,
                           n = 250,
                           nr_correlated_Xs = c(5,20),
                           nr_uncorrelated_Xs = 250,
                           mean_reg_weights_assoc_X =
                             c(0.9,0.5),
                           sd_reg_weights_assoc_X =
                             c(0.05, 0.05),
                           Xnoise_min = -0.3,
                           Xnoise_max = 0.3,
                           nr_correlated_Ys = c(10,15),
                           nr_uncorrelated_Ys = 350,
                           mean_reg_weights_assoc_Y =
                             c(0.9,0.6),
                           sd_reg_weights_assoc_Y =
                             c(0.05, 0.05),
                           Ynoise_min = -0.3,
                           Ynoise_max = 0.3)



# seperate predictor and predicted sets
X <- dataXY$X
Y <- dataXY$Y

# run sRDA
RDA.res <- sRDA(predictor = X, predicted = Y, nonzero = 5,
ridge_penalty = 1, penalization = "ust")


# check first 10 weights of X
RDA.res$ALPHA[1:10]

## Not run: 
##D # run sRDA with cross-validation to determine best penalization parameters
##D RDA.res <- sRDA(predictor = X, predicted = Y, nonzero = c(5,10,15),
##D ridge_penalty = c(0.1,1), penalization = "enet", cross_validate = TRUE,
##D parallel_CV = TRUE)
##D 
##D # check first 10 weights of X
##D RDA.res$ALPHA[1:10]
##D 
##D # check the Ridge parameter and the number of nonzeros included in the model
##D RDA.res$ridge_penalty
##D RDA.res$nr_nonzeros
##D 
##D # check how much time the cross validation did take
##D RDA.res$CV_results$stime
##D 
##D # obtain multiple latent variables (components)
##D RDA.res <- sRDA(predictor = X, predicted = Y, nonzero = c(5,10,15),
##D ridge_penalty = c(0.1,1), penalization = "enet", cross_validate = TRUE,
##D parallel_CV = TRUE, multiple_LV = TRUE, nr_LVs = 2, max_iterations = 5)
##D 
##D # check first 20 weights of X in first two component
##D RDA.res$ALPHA[[1]][1:20]
##D RDA.res$ALPHA[[2]][1:20]
##D 
##D # components are orthogonal to each other
##D t(RDA.res$XI[[1]]) %*% RDA.res$XI[[2]]
##D 
## End(Not run)



