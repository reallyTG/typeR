library(labdsv)


### Name: indval
### Title: Dufrene-Legendre Indicator Species Analysis
### Aliases: indval duleg indval.default indval.stride summary.indval
### Keywords: cluster

### ** Examples

    data(bryceveg) # returns a vegetation data.frame
    dis.bc <- dsvdis(bryceveg,'bray/curtis') # returns a dissimilarity matrix
    clust <- sample(1:5,nrow(bryceveg),replace=TRUE)
    indval(bryceveg,clust)



