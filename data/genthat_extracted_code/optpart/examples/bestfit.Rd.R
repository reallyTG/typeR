library(optpart)


### Name: bestfit
### Title: Identify the Goodness-of-Fit of Cluster Members
### Aliases: bestfit
### Keywords: clustering

### ** Examples

    data(shoshveg)                      # returns vegetation matrix
    dis.bc <- dsvdis(shoshveg,'bray')   # Bray/Curtis dissimilarity matrix 
    opt.5 <- optpart(5,dis.bc)          # 5 cluster partition
    print(class(opt.5))
    fit <- bestfit(opt.5,1)             # goodness-of-fit for cluster 1
    sil.5 <- silhouette(opt.5,dis.bc)   # calculate silhouette widths
    fit2 <- bestfit(sil.5,1)            # goodness-of-fit for cluster 1



