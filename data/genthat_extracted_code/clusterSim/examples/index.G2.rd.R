library(clusterSim)


### Name: index.G2
### Title: Calculates G2 internal cluster quality index
### Aliases: index.G2
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G2(d,c$clustering)
print(icq)

# Example 2
library(clusterSim)
data(data_ordinal)
d <- dist.GDM(data_ordinal, method="GDM2")
# nc - number_of_clusters
min_nc=2
max_nc=6
res <- array(0,c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
clusters <- NULL
for (nc in min_nc:max_nc)
{
cl2 <- pam(d, nc, diss=TRUE)
res[nc-min_nc+1,2] <- G2 <- index.G2(d,cl2$cluster)
clusters <- rbind(clusters,cl2$cluster)
}
print(paste("max G2 for",(min_nc:max_nc)[which.max(res[,2])],"clusters=",max(res[,2])))
print("clustering for max G2")
print(clusters[which.max(res[,2]),])
write.table(res,file="G2_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G2", xaxt="n")
axis(1, c(min_nc:max_nc))



