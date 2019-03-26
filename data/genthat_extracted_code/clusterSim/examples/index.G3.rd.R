library(clusterSim)


### Name: index.G3
### Title: Calculates G3 internal cluster quality index
### Aliases: index.G3
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
d <- dist.GDM(data_ratio)
c <- pam(d, 5, diss = TRUE)
icq <- index.G3(d,c$clustering)
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
hc <- hclust(d, method="complete")
cl2 <- cutree(hc, k=nc)
res[nc-min_nc+1,2] <- G3 <- index.G3(d,cl2)
clusters <- rbind(clusters,cl2)
}
print(paste("min G3 for",(min_nc:max_nc)[which.min(res[,2])],"clusters=",min(res[,2])))
print("clustering for min G3")
print(clusters[which.min(res[,2]),])
write.table(res,file="G3_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res, type="p", pch=0, xlab="Number of clusters", ylab="G3", xaxt="n")
axis(1, c(min_nc:max_nc))



