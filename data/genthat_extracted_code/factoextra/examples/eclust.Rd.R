library(factoextra)


### Name: eclust
### Title: Visual enhancement of clustering analysis
### Aliases: eclust

### ** Examples

# Load and scale data
data("USArrests")
df <- scale(USArrests)

# Enhanced k-means clustering
# nboot >= 500 is recommended
res.km <- eclust(df, "kmeans", nboot = 2)
# Silhouette plot
fviz_silhouette(res.km)
# Optimal number of clusters using gap statistics
res.km$nbclust
# Print result
 res.km
 
## Not run: 
##D  # Enhanced hierarchical clustering
##D  res.hc <- eclust(df, "hclust", nboot = 2) # compute hclust
##D   fviz_dend(res.hc) # dendrogam
##D   fviz_silhouette(res.hc) # silhouette plot
## End(Not run)
 



