library(FunCluster)


### Name: FunCluster.R-package
### Title: Functional Profiling of Microarray Expression Data
### Aliases: FunCluster.R-package
### Keywords: cluster

### ** Examples

          ## Not run: 
##D           ## most common use
##D           FunCluster(go.direct = FALSE, alpha = 0.05, clusterm = "cc",
##D           		      org = "HS", location = FALSE, compare = 
##D           		      "common.correl.genes", corr.th = 0.85, 
##D           		      corr.met = "greedy", two.lists = TRUE, 
##D           		      restrict = TRUE)
##D           
##D           ## when only GO direct annotations are to be used and detailed 
##D           findings are needed
##D           FunCluster(go.direct = TRUE, alpha = 0.05, clusterm = "cc",
##D           		      org = "HS", location = FALSE, compare = 
##D           		      "common.correl.genes", corr.th = 0.85, 
##D           		      corr.met = "greedy", two.lists = TRUE, 
##D           		      restrict = TRUE, details = TRUE)
##D           
##D           ## hierarchical agglomerative clustering and Silhouette computations 
##D           can be used for the preliminary step of building clusters of 
##D           co-expressed transcripts
##D           FunCluster(go.direct = TRUE, alpha = 0.05, clusterm = "cc",
##D           		      org = "HS", location = FALSE, compare = 
##D           		      "common.correl.genes", corr.th = 0.85, 
##D           		      corr.met = "hierarchical", two.lists = TRUE, 
##D           		      restrict = TRUE)
##D 
##D           ## use only common annotated transcripts for the annotation clustering  
##D           FunCluster(go.direct = FALSE, alpha = 0.05, clusterm = "cc",
##D           		      org = "HS", location = FALSE, compare = 
##D           		      "common. genes",
##D           		      two.lists = TRUE, restrict = TRUE)
##D 
##D           ## the following example forces the use of a previous GO release 
##D           (e.g. January 2006) for updating annotations
##D           annotations(date.annot = "200601")
##D           
## End(Not run)



