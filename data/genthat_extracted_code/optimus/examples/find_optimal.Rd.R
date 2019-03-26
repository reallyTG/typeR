library(optimus)


### Name: find_optimal
### Title: Find an optimal classification among competing clustering
###   solutions
### Aliases: find_optimal
### Keywords: optimal, partition, partitioning

### ** Examples


## Prep the 'swamps' data
## ======================

data(swamps) # see ?swamps
swamps <- swamps[,-1]

## Assess clustering solutions using cutree() method
## =================================================

## perhaps not the best clustering option, but this is base R
swamps_hclust <- hclust(d = dist(x = log1p(swamps), method = "canberra"),
                       method = "complete")

## calculate sum-of-AIC values for 10:25 clusters, using the hclust() output
swamps_hclust_aics <- find_optimal(data = swamps, clustering = swamps_hclust,
family = "poisson", cutreeLevels = 10:25)

## Looks like ~20 clusters is where predictive performance levels off

## Note here that the data passed to find_optimal() was actually NOT the
## data used for clustering (transform/distance), rather it was the
## original abundance (response) data of interest

## plot - lower sum-of-AIC valuea indicate 'better' clustering
plot(swamps_hclust_aics)


## Not run: 
##D ## Assess clustering solutions by supplying a list of solutions
##D ## ============================================================
##D 
##D ## again, we probably wouldn't do this, but for illustrative purposes
##D ## note that we are generating a list of solutions this time
##D swamps_kmeans <- lapply(X = 2:40,
##D FUN = function(x, data) {stats::kmeans(x = data, centers = x)$cluster},
##D data = swamps)
##D 
##D ## calculate sum-of-AIC values for the list of clustering solutions
##D swamps_kmeans_aics <- find_optimal(data = swamps, clustering = swamps_kmeans,
##D family = "poisson") # note cutreeLevels= argument is not needed
##D 
##D plot(swamps_kmeans_aics)
## End(Not run)

## See vignette for more explanation than this example
## ============================================================




