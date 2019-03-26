library(mgwrsar)


### Name: kernelW_C
### Title: Computes weight matrix for a given kernel and bandwidth
### Aliases: kernelW_C

### ** Examples

## No test: 
data(data_mgwrsar);coord=as.matrix(mydata[,c("x_lat","y_lon")]);
W=kernelW_C(coord,100,'bisq_knn',FALSE,'GD',1,500,5000,FALSE,0,FALSE)
plot(D_dense_C(coord[1,1],coord[1,2],coord[,1],coord[,2]),W[1,])
## End(No test)



