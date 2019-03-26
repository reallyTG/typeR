library(ClusterRankTest)


### Name: clus.rank.sum
### Title: Cluster Rank Test
### Aliases: clus.rank.sum

### ** Examples


Cluster<-c(1,1,2,2,2,2,3,3,3)
X<-c(1,4,2,4,6,7,4,7,8)
grp<-c(0,1,0,0,1,1,1,0,1)
dataset <- list(Cluster,X,grp)

 clus.rank.sum(Cluster, X, grp, test="DS")
 



