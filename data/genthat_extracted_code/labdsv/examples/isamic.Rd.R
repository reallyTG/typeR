library(labdsv)


### Name: isamic
### Title: Indicator Species Analysis Minimizing Intermediate Occurrences
### Aliases: isamic duarm
### Keywords: cluster

### ** Examples

    data(bryceveg)
    dis.bc <- dsvdis(bryceveg,'bray/curtis')
    clust <- sample(1:5,nrow(bryceveg),replace=TRUE)
    isamic(bryceveg,clust)



