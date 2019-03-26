library(iCluster)


### Name: iCluster
### Title: Integrative clustering of multiple genomic data types
### Aliases: iCluster
### Keywords: models

### ** Examples


data(breast.chr17)
fit=iCluster(breast.chr17, k=4, lambda=c(0.2,0.2))
plotiCluster(fit=fit, label=rownames(breast.chr17[[2]]))
compute.pod(fit)



