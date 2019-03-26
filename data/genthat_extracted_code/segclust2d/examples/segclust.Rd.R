library(segclust2d)


### Name: segclust
### Title: Segmentation/Clustering of movement data - Generic function
### Aliases: segclust segclust.data.frame segclust.Move segclust.ltraj

### ** Examples

#' @examples
df <-  test_data()$data
#' # data is a data.frame with column 'x' and 'y'
# Simple segmentation with automatic subsampling if data has more than 1000 rows:
res <- segclust(df, Kmax = 10, lmin = 20, ncluster = 3, seg.var = c("x","y"))
 # Plot results
 plot(res)
 segmap(res, coord.names = c("x","y"))
 # check penalized likelihood of alternative number of segment possible. There should
 # be a clear break if the segmentation is good
 plot_BIC(res)
## Not run: 
##D # Advanced options:
##D # Run with automatic subsampling if df has more than 500 rows:
##D res <- segclust(df, Kmax = 30, lmin = 10, ncluster = 2:4,
##D  seg.var = c("x","y"), subsample_over = 500)
##D # Run with subsampling by 2:
##D res <- segclust(df, Kmax = 30, lmin = 10, , ncluster = 2:4,
##D  seg.var = c("x","y"), subsample_by = 2)
##D # Disable subsampling:
##D res <- segclust(df, Kmax = 30, lmin = 10, , ncluster = 2:4,
##D  seg.var = c("x","y"), subsample = FALSE)
##D # Disabling automatic scaling of variables for segmentation (standardazing the variables) :
##D  res <- segclust(df, Kmax = 30, lmin = 10, seg.var = c("dist","angle"),
##D   scale.variable = FALSE)
## End(Not run)



