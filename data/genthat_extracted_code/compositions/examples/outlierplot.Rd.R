library(compositions)


### Name: outlierplot
### Title: Plot various graphics to analyse outliers.
### Aliases: outlierplot outlierplot.acomp
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(SimulatedAmounts)
##D outlierplot(acomp(sa.outliers5))
##D 
##D datas <- list(data1=sa.outliers1,data2=sa.outliers2,data3=sa.outliers3,
##D                 data4=sa.outliers4,data5=sa.outliers5,data6=sa.outliers6)
##D 
##D opar<-par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D tmp<-mapply(function(x,y) {
##D outlierplot(x,type="scatter",class.type="grade");
##D   title(y)
##D },datas,names(datas))
##D 
##D 
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D tmp<-mapply(function(x,y) {
##D   myCls2 <- OutlierClassifier1(x,alpha=0.05,type="all",corrected=TRUE)
##D   outlierplot(x,type="scatter",classifier=OutlierClassifier1,class.type="best",
##D   Legend=legend(1,1,levels(myCls),xjust=1,col=colcode,pch=pchcode),
##D   pch=as.numeric(myCls2));
##D   legend(0,1,legend=levels(myCls2),pch=1:length(levels(myCls2)))
##D   title(y)
##D },datas,names(datas))
##D # To slow
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="ecdf",main=names(datas)[i])
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="portion",main=names(datas)[i])
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="nout",main=names(datas)[i])
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="distdist",main=names(datas)[i])
##D par(opar)
##D 
## End(Not run)



