library(optpart)


### Name: extract
### Title: Extract A Specific Cluster Solution From A Stride
### Aliases: extract extract.stride
### Keywords: cluster

### ** Examples

    data(shoshveg)		            # get vegettion data
    dis.bc <- dsvdis(shoshveg,'bray')   # calculate dissimilarity matrix
    avg.hcl <- hclust(dis.bc,'average') # average linkage cluster analysis
    avg.2.10 <- stride(2:10,avg.hcl)    # compute stride
    res <- extract(avg.2.10,8)          # extract 8-cluster solution



