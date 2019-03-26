library(mgwrsar)


### Name: KNN
### Title: A function that returns a row normalized weight matrix based on
###   k first neighbors, to be documented
### Aliases: KNN

### ** Examples

## No test: 
data(data_mgwrsar)
coord=as.matrix(mydata[,c("x_lat","y_lon")])
W=KNN(coord,8)
which(W[1,]>0)
W[1,W[1,]>0]
## End(No test)



