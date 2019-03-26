library(ipft)


### Name: ipfCluster
### Title: Creates clusters using the specified method
### Aliases: ipfCluster

### ** Examples


    clusters <- ipfCluster(head(ipftrain, 20)[, 169:170], k = 4)

    clusters <- ipfCluster(head(ipftrain[, grep('^wap', names(ipftrain))], 20),
    method = 'AP')$clusters




