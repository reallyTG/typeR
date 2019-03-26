library(optimus)


### Name: merge_clusters
### Title: Iteratively merges clusters in a way that improves predictive
###   performance
### Aliases: merge_clusters
### Keywords: iterative, merging, pairwise reallocation,

### ** Examples


## Not run: 
##D ## Prep the 'swamps' data
##D ## ======================
##D 
##D data(swamps) # see ?swamps
##D swamps <- swamps[,-1]
##D 
##D ## Merge via AIC and compare to hclust heirarchy
##D ## =============================================
##D 
##D ## perhaps not the best clustering option, but this is base R
##D swamps_hclust <- hclust(d = dist(x = log1p(swamps), method = "canberra"),
##D                        method = "complete")
##D 
##D ## generate iteratively merged clustering solutions, based on sum-of-AIC
##D clustering_aicmerge <- merge_clusters(swamps, cutree(tree = swamps_hclust, k = 30),
##D family = "poisson", n.iter = 20)
##D 
##D ## compare to hclust heirarchy
##D optimal_aicmerge <- find_optimal(data = swamps, clustering = clustering_aicmerge,
##D family = "poisson")
##D 
##D optimal_hclust <- find_optimal(data = swamps, clustering = swamps_hclust,
##D family = "poisson", cutreeLevels = 10:30))
##D 
##D plot(optimal_aicmerge)
##D points(optimal_hclust, col = "red", pch = 16)
## End(Not run)




