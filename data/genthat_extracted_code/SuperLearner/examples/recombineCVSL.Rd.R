library(SuperLearner)


### Name: recombineCVSL
### Title: Recombine a CV.SuperLearner fit using a new metalearning method
### Aliases: recombineCVSL
### Keywords: models

### ** Examples

## Not run: 
##D 
##D # Binary outcome example adapted from SuperLearner examples
##D 
##D set.seed(1)
##D N <- 200
##D X <- matrix(rnorm(N*10), N, 10)
##D X <- as.data.frame(X)
##D Y <- rbinom(N, 1, plogis(.2*X[, 1] + .1*X[, 2] - .2*X[, 3] + 
##D   .1*X[, 3]*X[, 4] - .2*abs(X[, 4])))
##D 
##D SL.library <- c("SL.glmnet", "SL.glm", "SL.knn", "SL.gam", "SL.mean")
##D 
##D # least squares loss function
##D set.seed(1) # for reproducibility
##D cvfit_nnls <- CV.SuperLearner(Y = Y, X = X, V = 10, SL.library = SL.library, 
##D   verbose = TRUE, method = "method.NNLS", family = binomial())
##D cvfit_nnls$coef
##D #    SL.glmnet_All SL.glm_All  SL.knn_All SL.gam_All SL.mean_All
##D # 1      0.0000000 0.00000000 0.000000000  0.4143862   0.5856138
##D # 2      0.0000000 0.00000000 0.304802397  0.3047478   0.3904498
##D # 3      0.0000000 0.00000000 0.002897533  0.5544075   0.4426950
##D # 4      0.0000000 0.20322642 0.000000000  0.1121891   0.6845845
##D # 5      0.1743973 0.00000000 0.032471026  0.3580624   0.4350693
##D # 6      0.0000000 0.00000000 0.099881535  0.3662309   0.5338876
##D # 7      0.0000000 0.00000000 0.234876082  0.2942472   0.4708767
##D # 8      0.0000000 0.06424676 0.113988158  0.5600208   0.2617443
##D # 9      0.0000000 0.00000000 0.338030342  0.2762604   0.3857093
##D # 10     0.3022442 0.00000000 0.294226204  0.1394534   0.2640762
##D 
##D 
##D # negative log binomial likelihood loss function
##D cvfit_nnloglik <- recombineCVSL(cvfit_nnls, method = "method.NNloglik")
##D cvfit_nnloglik$coef
##D #    SL.glmnet_All SL.glm_All SL.knn_All SL.gam_All SL.mean_All
##D # 1      0.0000000  0.0000000 0.00000000  0.5974799  0.40252010
##D # 2      0.0000000  0.0000000 0.31177345  0.6882266  0.00000000
##D # 3      0.0000000  0.0000000 0.01377469  0.8544238  0.13180152
##D # 4      0.0000000  0.1644188 0.00000000  0.2387919  0.59678930
##D # 5      0.2142254  0.0000000 0.00000000  0.3729426  0.41283197
##D # 6      0.0000000  0.0000000 0.00000000  0.5847150  0.41528502
##D # 7      0.0000000  0.0000000 0.47538172  0.5080311  0.01658722
##D # 8      0.0000000  0.0000000 0.00000000  1.0000000  0.00000000
##D # 9      0.0000000  0.0000000 0.45384961  0.2923480  0.25380243
##D # 10     0.3977816  0.0000000 0.27927906  0.1606384  0.16230097
##D 
##D # If we use the same seed as the original `cvfit_nnls`, then
##D # the recombineCVSL and CV.SuperLearner results will be identical
##D # however, the recombineCVSL version will be much faster since
##D # it doesn't have to re-fit all the base learners, V times each.
##D set.seed(1)
##D cvfit_nnloglik2 <- CV.SuperLearner(Y = Y, X = X, V = 10, SL.library = SL.library,
##D   verbose = TRUE, method = "method.NNloglik", family = binomial())
##D cvfit_nnloglik2$coef
##D #    SL.glmnet_All SL.glm_All SL.knn_All SL.gam_All SL.mean_All
##D # 1      0.0000000  0.0000000 0.00000000  0.5974799  0.40252010
##D # 2      0.0000000  0.0000000 0.31177345  0.6882266  0.00000000
##D # 3      0.0000000  0.0000000 0.01377469  0.8544238  0.13180152
##D # 4      0.0000000  0.1644188 0.00000000  0.2387919  0.59678930
##D # 5      0.2142254  0.0000000 0.00000000  0.3729426  0.41283197
##D # 6      0.0000000  0.0000000 0.00000000  0.5847150  0.41528502
##D # 7      0.0000000  0.0000000 0.47538172  0.5080311  0.01658722
##D # 8      0.0000000  0.0000000 0.00000000  1.0000000  0.00000000
##D # 9      0.0000000  0.0000000 0.45384961  0.2923480  0.25380243
##D # 10     0.3977816  0.0000000 0.27927906  0.1606384  0.16230097
##D 
## End(Not run)



