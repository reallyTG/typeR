library(dtwclust)


### Name: DBA
### Title: DTW Barycenter Averaging
### Aliases: DBA dba

### ** Examples

# Sample data
data(uciCT)

# Obtain an average for the first 5 time series
dtw_avg <- DBA(CharTraj[1:5], CharTraj[[1]], trace = TRUE)

# Plot
matplot(do.call(cbind, CharTraj[1:5]), type = "l")
points(dtw_avg)

# Change the provided order
dtw_avg2 <- DBA(CharTraj[5:1], CharTraj[[1]], trace = TRUE)

# Same result?
all.equal(dtw_avg, dtw_avg2)

## Not run: 
##D # ====================================================================================
##D # Multivariate versions
##D # ====================================================================================
##D 
##D # sample centroid reference
##D cent <- CharTrajMV[[3L]]
##D # sample series
##D x <- CharTrajMV[[1L]]
##D # sample set of series
##D X <- CharTrajMV[1L:5L]
##D 
##D # the by-series version does something like this for each series and the centroid
##D alignment <- dtw_basic(x, cent, backtrack = TRUE)
##D # alignment$index1 and alginment$index2 indicate how to map x to cent (row-wise)
##D 
##D # the by-variable version treats each variable separately
##D alignment1 <- dtw_basic(x[,1L], cent[,1L], backtrack = TRUE)
##D alignment2 <- dtw_basic(x[,2L], cent[,2L], backtrack = TRUE)
##D alignment3 <- dtw_basic(x[,3L], cent[,3L], backtrack = TRUE)
##D 
##D # effectively doing:
##D X1 <- lapply(X, function(x) { x[,1L] })
##D X2 <- lapply(X, function(x) { x[,2L] })
##D X3 <- lapply(X, function(x) { x[,3L] })
##D 
##D dba1 <- dba(X1, cent[,1L])
##D dba2 <- dba(X2, cent[,2L])
##D dba3 <- dba(X3, cent[,3L])
##D 
##D new_cent <- cbind(dba1, dba2, dba3)
##D 
##D # sanity check
##D newer_cent <- dba(X, cent, mv.ver = "by-variable")
##D all.equal(newer_cent, new_cent, check.attributes = FALSE) # ignore names
##D 
## End(Not run)



