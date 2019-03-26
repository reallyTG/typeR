library(segclust2d)


### Name: segmentation
### Title: Segmentation of movement data - Generic function
### Aliases: segmentation segmentation.data.frame segmentation.Move
###   segmentation.ltraj

### ** Examples

df <-  test_data()$data
#' # data is a data.frame with column 'x' and 'y'
# Simple segmentation with automatic subsampling if data has more than 1000 rows:
res <- segmentation(df, Kmax = 30, lmin = 10, coord.names = c("x","y"), 
type = 'home-range')
 # Plot results
 plot(res)
 segmap(res)
 # check likelihood of alternative number of segment possible. There should
 # be a clear break if the segmentation is good
 plot_likelihood(res)
## Not run: 
##D # Advanced options:
##D # Run with automatic subsampling if df has more than 500 rows:
##D res <- segmentation(df, Kmax = 30, lmin = 10, coord.names = c("x","y"), 
##D type = 'home-range', subsample_over = 500)
##D 
##D # Run with subsampling by 2:
##D res <- segmentation(df, Kmax = 30, lmin = 10, coord.names = c("x","y"),
##D  type = 'home-range', subsample_by = 2)
##D  
##D # Disable subsampling:
##D res <- segmentation(df, Kmax = 30, lmin = 10, coord.names = c("x","y"), 
##D type = 'home-range', subsample = FALSE)
##D 
##D # Run on other kind of variables : 
##D  res <- segmentation(df, Kmax = 30, lmin = 10, seg.var = c("dist","angle"), 
##D  type = 'behavior')
##D  
##D # Automatic scaling of variables for segmentation 
##D (set a mean of 0 and a standard deviation of 1 for both variables)
##D 
##D  res <- segmentation(df, Kmax = 30, lmin = 10, seg.var = c("dist","angle"),
##D   type = 'behavior', scale.variable = TRUE)
##D  
## End(Not run)



