library(crimelinkage)


### Name: crimeClust_hier
### Title: Agglomerative Hierarchical Crime Series Clustering
### Aliases: crimeClust_hier

### ** Examples

data(crimes)
 #- cluster the first 10 crime incidents
 crimedata = crimes[1:10,]
 varlist = list(spatial = c("X", "Y"), temporal = c("DT.FROM","DT.TO"),
     categorical = c("MO1",  "MO2", "MO3"))
 estimateBF <- function(X) rnorm(NROW(X))   # random estimation of log Bayes Factor
 HC = crimeClust_hier(crimedata,varlist,estimateBF)
 plot_hcc(HC,yticks=-2:2)

 # See vignette: "Crime Series Identification and Clustering" for more examples.



