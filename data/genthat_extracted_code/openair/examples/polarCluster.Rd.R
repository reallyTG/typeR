library(openair)


### Name: polarCluster
### Title: K-means clustering of bivariate polar plots
### Aliases: polarCluster

### ** Examples


## Not run: 
##D # load example data from package
##D data(mydata)
##D 
##D ## plot 2-8 clusters. Warning! This can take several minutes...
##D 
##D polarCluster(mydata, pollutant = "nox", n.clusters = 2:8)
##D 
##D 
##D # basic plot with 6 clusters
##D results <- polarCluster(mydata, pollutant = "nox", n.clusters = 6)
##D 
##D ## get results, could read into a new data frame to make it easier to refer to
##D ## e.g. results <- results$data...
##D head(results$data)
##D 
##D ## how many points are there in each cluster?
##D table(results$data$cluster)
##D 
##D ## plot clusters 3 and 4 as a timeVariation plot using SAME colours as in
##D ## cluster plot
##D timeVariation(subset(results$data, cluster %in% c("3", "4")), pollutant = "nox",
##D group = "cluster", col = openColours("Paired", 6)[c(3, 4)])
## End(Not run)




