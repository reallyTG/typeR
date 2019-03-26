library(dtwclust)


### Name: tsclust
### Title: Time series clustering
### Aliases: tsclust

### ** Examples

#' NOTE: More examples are available in the vignette. Here are just some miscellaneous
#' examples that might come in handy. They should all work, but some don't run
#' automatically.

# Load data
data(uciCT)

# ====================================================================================
# Simple partitional clustering with Euclidean distance and PAM centroids
# ====================================================================================

# Reinterpolate to same length
series <- reinterpolate(CharTraj, new.length = max(lengths(CharTraj)))

# Subset for speed
series <- series[1:20]
labels <- CharTrajLabels[1:20]

# Making many repetitions
pc.l2 <- tsclust(series, k = 4L,
                 distance = "L2", centroid = "pam",
                 seed = 3247, trace = TRUE,
                 control = partitional_control(nrep = 10L))

# Cluster validity indices
sapply(pc.l2, cvi, b = labels)

# ====================================================================================
# Hierarchical clustering with Euclidean distance
# ====================================================================================

# Re-use the distance matrix from the previous example (all matrices are the same)
# Use all available linkage methods for function hclust
hc.l2 <- tsclust(series, type = "hierarchical",
                 k = 4L, trace = TRUE,
                 control = hierarchical_control(method = "all",
                                                distmat = pc.l2[[1L]]@distmat))

# Plot the best dendrogram according to variation of information
plot(hc.l2[[which.min(sapply(hc.l2, cvi, b = labels, type = "VI"))]])

# ====================================================================================
# Multivariate time series
# ====================================================================================

# Multivariate series, provided as a list of matrices
mv <- CharTrajMV[1L:20L]

# Using GAK distance
mvc <- tsclust(mv, k = 4L, distance = "gak", seed = 390,
               args = tsclust_args(dist = list(sigma = 100)))

# Note how the variables of each series are appended one after the other in the plot
plot(mvc)

## Not run: 
##D # ====================================================================================
##D # This function is more verbose but allows for more explicit fine-grained control
##D # ====================================================================================
##D 
##D tsc <- tsclust(series, k = 4L,
##D                distance = "gak", centroid = "dba",
##D                preproc = zscore, seed = 382L, trace = TRUE,
##D                control = partitional_control(iter.max = 30L),
##D                args = tsclust_args(preproc = list(center = FALSE),
##D                                    dist = list(window.size = 20L,
##D                                                sigma = 100),
##D                                    cent = list(window.size = 15L,
##D                                                norm = "L2",
##D                                                trace = TRUE)))
##D 
##D # ====================================================================================
##D # Registering a custom distance with the 'proxy' package and using it
##D # ====================================================================================
##D 
##D # Normalized asymmetric DTW distance
##D ndtw <- function(x, y, ...) {
##D     dtw::dtw(x, y, step.pattern = asymmetric,
##D              distance.only = TRUE, ...)$normalizedDistance
##D }
##D 
##D # Registering the function with 'proxy'
##D if (!pr_DB$entry_exists("nDTW"))
##D     proxy::pr_DB$set_entry(FUN = ndtw, names=c("nDTW"),
##D                            loop = TRUE, type = "metric", distance = TRUE,
##D                            description = "Normalized asymmetric DTW")
##D 
##D # Subset of (original) data for speed
##D pc.ndtw <- tsclust(series[-1L], k = 4L,
##D                    distance = "nDTW",
##D                    seed = 8319,
##D                    trace = TRUE,
##D                    args = tsclust_args(dist = list(window.size = 18L)))
##D 
##D # Which cluster would the first series belong to?
##D # Notice that newdata is provided as a list
##D predict(pc.ndtw, newdata = series[1L])
##D 
##D # ====================================================================================
##D # Custom hierarchical clustering
##D # ====================================================================================
##D 
##D require(cluster)
##D 
##D hc.diana <- tsclust(series, type = "h", k = 4L,
##D                     distance = "L2", trace = TRUE,
##D                     control = hierarchical_control(method = diana))
##D 
##D plot(hc.diana, type = "sc")
##D 
##D # ====================================================================================
##D # TADPole clustering
##D # ====================================================================================
##D 
##D pc.tadp <- tsclust(series, type = "tadpole", k = 4L,
##D                    control = tadpole_control(dc = 1.5,
##D                                              window.size = 18L))
##D 
##D # Modify plot, show only clusters 3 and 4
##D plot(pc.tadp, clus = 3:4,
##D      labs.arg = list(title = "TADPole, clusters 3 and 4",
##D                      x = "time", y = "series"))
##D 
##D # Saving and modifying the ggplot object with custom time labels
##D require(scales)
##D t <- seq(Sys.Date(), len = length(series[[1L]]), by = "day")
##D gpc <- plot(pc.tadp, time = t, plot = FALSE)
##D 
##D gpc + ggplot2::scale_x_date(labels = date_format("%b-%Y"),
##D                             breaks = date_breaks("2 months"))
##D 
##D # ====================================================================================
##D # Specifying a centroid function for prototype extraction in hierarchical clustering
##D # ====================================================================================
##D 
##D # Seed is due to possible randomness in shape_extraction when selecting a basis series
##D hc.sbd <- tsclust(CharTraj, type = "hierarchical",
##D                   k = 20L, distance = "sbd",
##D                   preproc = zscore, centroid = shape_extraction,
##D                   seed = 320L)
##D 
##D plot(hc.sbd, type = "sc")
##D 
##D # ====================================================================================
##D # Using parallel computation to optimize several random repetitions
##D # and distance matrix calculation
##D # ====================================================================================
##D require(doParallel)
##D 
##D # Create parallel workers
##D cl <- makeCluster(detectCores())
##D invisible(clusterEvalQ(cl, library(dtwclust)))
##D registerDoParallel(cl)
##D 
##D ## Use constrained DTW and PAM
##D pc.dtw <- tsclust(CharTraj, k = 20L, seed = 3251, trace = TRUE,
##D                   args = tsclust_args(dist = list(window.size = 18L)))
##D 
##D ## Use constrained DTW with DBA centroids
##D pc.dba <- tsclust(CharTraj, k = 20L, centroid = "dba",
##D                   seed = 3251, trace = TRUE,
##D                   args = tsclust_args(dist = list(window.size = 18L),
##D                                       cent = list(window.size = 18L)))
##D 
##D #' Using distance based on global alignment kernels
##D pc.gak <- tsclust(CharTraj, k = 20L,
##D                   distance = "gak",
##D                   centroid = "dba",
##D                   seed = 8319,
##D                   trace = TRUE,
##D                   control = partitional_control(nrep = 8L),
##D                   args = tsclust_args(dist = list(window.size = 18L),
##D                                       cent = list(window.size = 18L)))
##D 
##D # Stop parallel workers
##D stopCluster(cl)
##D 
##D # Return to sequential computations. This MUST be done if stopCluster() was called
##D registerDoSEQ()
## End(Not run)



