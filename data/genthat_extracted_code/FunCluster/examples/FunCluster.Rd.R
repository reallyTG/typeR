library(FunCluster)


### Name: FunCluster
### Title: Functional Profiling of Microarray Expression Data
### Aliases: FunCluster
### Keywords: cluster

### ** Examples

          ## Not run: 
##D           ## load adipose tissue data (see Diabetes and JBCB papers for details)
##D           data(adipose)
##D 
##D           ## or load hyperinsulinemic muscle clamp data (see JBCB paper for details)
##D           data(insulin)
##D 
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
##D           		      corr.met = "hierarchical", 
##D           		      two.lists = TRUE, restrict = TRUE)
##D 
##D           ## use only common annotated transcripts for the annotation clustering  
##D           FunCluster(go.direct = FALSE, alpha = 0.05, clusterm = "cc",
##D           		      org = "HS", location = FALSE, compare = 
##D           		      "common.genes", two.lists = TRUE, 
##D           		      restrict = TRUE)
##D           
## End(Not run)


