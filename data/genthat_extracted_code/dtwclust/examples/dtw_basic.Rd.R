library(dtwclust)


### Name: dtw_basic
### Title: Basic DTW distance
### Aliases: dtw_basic

### ** Examples

## Not run: 
##D # ====================================================================================
##D # Understanding multivariate DTW
##D # ====================================================================================
##D 
##D # The variables for each multivariate time series are:
##D # tip force, x velocity, and y velocity
##D A1 <- CharTrajMV[[1L]] # A character
##D B1 <- CharTrajMV[[6L]] # B character
##D 
##D # Let's extract univariate time series
##D A1_TipForce <- A1[,1L] # first variable (column)
##D A1_VelX <- A1[,2L] # second variable (column)
##D A1_VelY <- A1[,3L] # third variable (column)
##D B1_TipForce <- B1[,1L] # first variable (column)
##D B1_VelX <- B1[,2L] # second variable (column)
##D B1_VelY <- B1[,3L] # third variable (column)
##D 
##D # Looking at each variable independently:
##D 
##D # Just force
##D dtw_basic(A1_TipForce, B1_TipForce, norm = "L1", step.pattern = symmetric1)
##D # Corresponding LCM
##D proxy::dist(A1_TipForce, B1_TipForce, method = "L1")
##D 
##D # Just x velocity
##D dtw_basic(A1_VelX, B1_VelX, norm = "L1", step.pattern = symmetric1)
##D # Corresponding LCM
##D proxy::dist(A1_VelX, B1_VelX, method = "L1")
##D 
##D # Just y velocity
##D dtw_basic(A1_VelY, B1_VelY, norm = "L1", step.pattern = symmetric1)
##D # Corresponding LCM
##D proxy::dist(A1_VelY, B1_VelY, method = "L1")
##D 
##D # NOTES:
##D # In the previous examples there was one LCM for each *pair* of series.
##D # Additionally, each LCM has dimensions length(A1_*) x length(B1_*)
##D 
##D # proxy::dist won't return the LCM for multivariate series,
##D # but we can do it manually:
##D mv_lcm <- function(mvts1, mvts2) {
##D     # Notice how the number of variables (columns) doesn't come into play here
##D     num_obs1 <- nrow(mvts1)
##D     num_obs2 <- nrow(mvts2)
##D 
##D     lcm <- matrix(0, nrow = num_obs1, ncol = num_obs2)
##D 
##D     for (i in 1L:num_obs1) {
##D         for (j in 1L:num_obs2) {
##D             # L1 norm for ALL variables (columns).
##D             # Consideration: mvts1 and mvts2 MUST have the same number of variables
##D             lcm[i, j] <- sum(abs(mvts1[i,] - mvts2[j,]))
##D         }
##D     }
##D 
##D     # return
##D     lcm
##D }
##D 
##D # Let's say we start with only x velocity and y velocity for each character
##D mvts1 <- cbind(A1_VelX, A1_VelY)
##D mvts2 <- cbind(B1_VelX, B1_VelY)
##D 
##D # DTW distance
##D dtw_d <- dtw_basic(mvts1, mvts2, norm = "L1", step.pattern = symmetric1)
##D # Corresponding LCM
##D lcm <- mv_lcm(mvts1, mvts2) # still 178 x 174
##D # Sanity check
##D all.equal(
##D     dtw_d,
##D     dtw::dtw(lcm, step.pattern = symmetric1)$distance # supports LCM as input
##D )
##D 
##D # Now let's consider all variables for each character
##D mvts1 <- cbind(mvts1, A1_TipForce)
##D mvts2 <- cbind(mvts2, B1_TipForce)
##D 
##D # Notice how the next code is exactly the same as before,
##D # even though we have one extra variable now
##D 
##D # DTW distance
##D dtw_d <- dtw_basic(mvts1, mvts2, norm = "L1", step.pattern = symmetric1)
##D # Corresponding LCM
##D lcm <- mv_lcm(mvts1, mvts2) # still 178 x 174
##D # Sanity check
##D all.equal(
##D     dtw_d,
##D     dtw::dtw(lcm, step.pattern = symmetric1)$distance # supports LCM as input
##D )
##D 
##D # By putting things in a list,
##D # proxy::dist returns the *cross-distance matrix*, not the LCM
##D series_list <- list(mvts1, mvts2)
##D distmat <- proxy::dist(series_list, method = "dtw_basic",
##D                        norm = "L1", step.pattern = symmetric1)
##D # So this should be TRUE
##D all.equal(distmat[1L, 2L], dtw_d)
##D 
##D # NOTE: distmat is a 2 x 2 matrix, because there are 2 multivariate series.
##D # Each *cell* in distmat has a corresponding LCM (not returned by the function).
##D # Proof:
##D manual_distmat <- matrix(0, nrow = 2L, ncol = 2L)
##D for (i in 1L:nrow(manual_distmat)) {
##D     for (j in 1L:ncol(manual_distmat)) {
##D         lcm_cell <- mv_lcm(series_list[[i]], series_list[[j]]) # LCM for this pair
##D         manual_distmat[i, j] <- dtw::dtw(lcm_cell, step.pattern = symmetric1)$distance
##D     }
##D }
##D # TRUE
##D all.equal(
##D     as.matrix(distmat),
##D     manual_distmat
##D )
## End(Not run)



