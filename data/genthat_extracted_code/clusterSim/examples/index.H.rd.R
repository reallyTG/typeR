library(clusterSim)


### Name: index.H
### Title: Calculates Hartigan index
### Aliases: index.H
### Keywords: cluster

### ** Examples

# Example 1
library(clusterSim)
data(data_ratio)
cl1<-pam(data_ratio,4)
cl2<-pam(data_ratio,5)
clall<-cbind(cl1$clustering,cl2$clustering)
index.H(data_ratio,clall)

# Example 2
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="euclidean")
# nc - number_of_clusters
min_nc=1
max_nc=20
min <- 0
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
clusters <- NULL
for (nc in min_nc:max_nc)
{
	print(nc)
	hc <- hclust(md, method="complete")
	cl1 <- cutree(hc, k=nc)
	cl2 <- cutree(hc, k=nc+1)
	clall <- cbind(cl1,cl2)
	res[nc-min_nc+1,2] <- H <- index.H(data_ratio,clall,centrotypes="centroids")
	if ((res[nc-min_nc+1, 2]<10) && (!found)){
       nc1 <- nc
       min <- H
       clopt <- cl1
		   found <- TRUE
	}
}
if (found)
{
	print(paste("minimal nc for H<=10 equals",nc1,"for H=",min))
	print("clustering for minimal nc where H<=10")
	print(clopt)
}else
{
	print("Clustering not found with H<=10")
}
write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="H",xaxt="n")
abline(h=10, untf=FALSE)
axis(1, c(min_nc:max_nc))

# Example 3
library(clusterSim)
data(data_ratio)
md <- dist(data_ratio, method="manhattan")
# nc - number_of_clusters
min_nc=1
max_nc=20
min <- 0
res <- array(0, c(max_nc-min_nc+1, 2))
res[,1] <- min_nc:max_nc
found <- FALSE
clusters <- NULL
for (nc in min_nc:max_nc)
{
	print(nc)
	hc <- hclust(md, method="complete")
	cl1 <- cutree(hc, k=nc)
	cl2 <- cutree(hc, k=nc+1)
	clall <- cbind(cl1,cl2)
	res[nc-min_nc+1,2] <- H <- index.H(data_ratio,clall,d=md,centrotypes="medoids")
	if ((res[nc-min_nc+1, 2]<10) && (!found)){
       nc1 <- nc
       min <- H
       clopt <- cl1
		   found <- TRUE
	}
}
if (found)
{
	print(paste("minimal nc for H<=10 equals",nc1,"for H=",min))
	print("clustering for minimal nc where H<=10")
	print(clopt)
}else
{
	print("Clustering not found with H<=10")
}
write.table(res,file="H_res.csv",sep=";",dec=",",row.names=TRUE,col.names=FALSE)
plot(res,type="p",pch=0,xlab="Number of clusters",ylab="H",xaxt="n")
abline(h=10, untf=FALSE)
axis(1, c(min_nc:max_nc))



