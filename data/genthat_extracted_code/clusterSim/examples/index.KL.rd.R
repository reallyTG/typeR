library(clusterSim)


### Name: index.KL
### Title: Calculates Krzanowski-Lai index
### Aliases: index.KL
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
cl3<-pam(data_ratio,6)
clall<-cbind(cl1$clustering,cl2$clustering,cl3$clustering)
index.KL(data_ratio,clall)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=15
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
  if(nc-1==1){
    clustering1<-rep(1,nrow(data_ratio))
  }
  else{
    clustering1 <- pam(md, nc-1, diss=TRUE)$clustering
  }
  clustering2 <- pam(md, nc, diss=TRUE)$clustering
  clustering3 <- pam(md, nc+1, diss=TRUE)$clustering
  clall<- cbind(clustering1, clustering2, clustering3)
  res[nc-min_nc+1,2] <- KL <- index.KL(data_ratio,clall,centrotypes="centroids")
  clusters <- rbind(clusters, clustering2)
} 
print(paste("max KL for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max KL")
print(clusters[which.max(res[,2]),])
write.table(res,file="KL_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="KL",xaxt="n")
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=2
max_nc=15
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
  if(nc-1==1){
    clustering1<-rep(1,nrow(data_ratio))
  }
  else{
    clustering1 <- pam(md, nc-1, diss=TRUE)$clustering
  }
  clustering2 <- pam(md, nc, diss=TRUE)$clustering
  clustering3 <- pam(md, nc+1, diss=TRUE)$clustering
  clall<- cbind(clustering1, clustering2, clustering3)
  res[nc-min_nc+1,2] <- KL <- index.KL(data_ratio,clall,d=md,centrotypes="medoids")
  clusters <- rbind(clusters, clustering2)
} 
print(paste("max KL for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max KL")
print(clusters[which.max(res[,2]),])
write.table(res,file="KL_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="KL",xaxt="n")
axis(1, c(min_nc:max_nc))



