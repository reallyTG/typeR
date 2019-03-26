library(pmml)


### Name: pmml.hclust
### Title: Generate PMML for hclust objects
### Aliases: pmml.hclust

### ** Examples


## Not run: 
##D # cluster the 4 numeric variables of the iris dataset
##D library(amap)
##D model <- hclusterpar(iris[,-5])
##D 
##D # Get the information about the cluster centers. The last 
##D # parameter of the function used is the number of clusters
##D # desired.
##D  library(rattle)
##D  centerInfo <- centers.hclust(iris[,-5],model,3)
##D 
##D # convert to pmml
##D library(pmml)
##D pmml(model,centers=centerInfo)
## End(Not run)




