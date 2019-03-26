library(compositions)


### Name: IsMahalanobisOutlier
### Title: Checking for outliers
### Aliases: IsMahalanobisOutlier
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(SimulatedAmounts)
##D 
##D datas <- list(data1=sa.outliers1,data2=sa.outliers2,data3=sa.outliers3,
##D               data4=sa.outliers4,data5=sa.outliers5,data6=sa.outliers6)
##D 
##D opar<-par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))
##D tmp<-mapply(function(x,y){
##D plot(x,col=ifelse(IsMahalanobisOutlier(x),"red","gray"))
##D   title(y)
##D },datas,names(datas))
## End(Not run)



