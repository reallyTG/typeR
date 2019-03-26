library(optpart)


### Name: compare
### Title: Compare Species Constancy for Specified Clusters
### Aliases: compare
### Keywords: multivariate

### ** Examples

    data(shoshveg)        # returns vegetation data set
    data(shoshsite)       # returns site data
    elev.clust <- as.numeric(factor(cut(shoshsite$elevation,5)))
                          # 5 elevation bands
    elev.const <- const(shoshveg,elev.clust)
    compare(elev.const,1,2)   # identify diagnostic species 



