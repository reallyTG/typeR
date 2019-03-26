library(funtimes)


### Name: DR
### Title: Downhill Riding (DR) Procedure
### Aliases: DR
### Keywords: trend ts

### ** Examples

## Not run: 
##D ## example 1
##D ## use iris data to test DR procedure
##D 
##D data(iris)  
##D require(clue)  # calculate NMI to compare the clustering result with the ground truth
##D require(scatterplot3d)
##D 
##D Data <- scale(iris[,-5])
##D ground_truth_label <- iris[,5]
##D 
##D # perform DR procedure to select optimal eps for DBSCAN 
##D # and save it in variable eps_opt
##D eps_opt <- DR(t(Data), method="DBSCAN", minPts = 5)$P_opt   
##D 
##D # apply DBSCAN with the optimal eps on iris data 
##D # and save the clustering result in variable res
##D res <- dbscan(Data, eps = eps_opt, minPts =5)$cluster  
##D 
##D # calculate NMI to compare the clustering result with the ground truth label
##D clue::cl_agreement(as.cl_partition(ground_truth_label),
##D                    as.cl_partition(as.numeric(res)), method = "NMI") 
##D # visualize the clustering result and compare it with the ground truth result
##D # 3D visualization of clustering result using variables Sepal.Width, Sepal.Length, 
##D # and Petal.Length
##D scatterplot3d(Data[,-4],color = res)
##D # 3D visualization of ground truth result using variables Sepal.Width, Sepal.Length,
##D # and Petal.Length
##D scatterplot3d(Data[,-4],color = as.numeric(ground_truth_label))
##D 
##D 
##D ## example 2
##D ## use synthetic time series data to test DR procedure
##D 
##D require(funtimes)
##D require(clue) 
##D require(zoo)
##D 
##D # simulate 16 time series for 4 clusters, each cluster contains 4 time series
##D set.seed(114) 
##D samp_Ind <- sample(12,replace=F)
##D time_points <- 30
##D X <- matrix(0,nrow=time_points,ncol = 12)
##D cluster1 <- sapply(1:4,function(x) arima.sim(list(order=c(1,0,0),ar=c(0.2)),
##D                                              n=time_points,mean=0,sd=1))
##D cluster2 <- sapply(1:4,function(x) arima.sim(list(order=c(2,0,0),ar=c(0.1,-0.2)),
##D                                              n=time_points,mean=2,sd=1))
##D cluster3 <- sapply(1:4,function(x) arima.sim(list(order=c(1,0,1),ar=c(0.3),ma=c(0.1)),
##D                                              n=time_points,mean=6,sd=1))
##D 
##D X[,samp_Ind[1:4]] <- t(round(cluster1,4))
##D X[,samp_Ind[5:8]] <- t(round(cluster2,4))
##D X[,samp_Ind[9:12]] <- t(round(cluster3,4))
##D 
##D 
##D # create ground truth label of the synthetic data
##D ground_truth_label = matrix(1,nrow=12,ncol=1) 
##D for(k in 1:3){
##D     ground_truth_label[samp_Ind[(4*k-4+1):(4*k)]] = k
##D }
##D 
##D # perform DR procedure to select optimal delta for TRUST
##D # and save it in variable delta_opt
##D delta_opt <- DR(X,method="TRUST")$P_opt 
##D 
##D # apply TRUST with the optimal delta on the synthetic data 
##D # and save the clustering result in variable res
##D res <- CSlideCluster(X,Delta=delta_opt ,Theta=0.9)  
##D 
##D # calculate NMI to compare the clustering result with the ground truth label
##D clue::cl_agreement(as.cl_partition(as.numeric(ground_truth_label)),
##D                    as.cl_partition(as.numeric(res)),method = "NMI")
##D 
##D # visualize the clustering result and compare it with the ground truth result
##D # visualization of the clustering result obtained by TRUST
##D plot.zoo(X, type = "l",plot.type = "single",col = res, xlab = "Time Index", ylab ="")
##D # visualization of the ground truth result 
##D plot.zoo(X, type = "l",plot.type = "single",col = ground_truth_label,
##D          xlab = "Time Index", ylab ="")
## End(Not run)




