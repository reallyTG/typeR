library(compositions)


### Name: outliersInCompositions
### Title: Analysing outliers in compositions.
### Aliases: outliersInCompositions
### Keywords: robust

### ** Examples

## Not run: 
##D # To slow
##D tmp<-set.seed(1400)
##D A <- matrix(c(0.1,0.2,0.3,0.1),nrow=2)
##D Mvar <- 0.1*ilrvar2clr(A%*%t(A))
##D Mcenter <- acomp(c(1,2,1))
##D typicalData <- rnorm.acomp(100,Mcenter,Mvar) # main population
##D colnames(typicalData)<-c("A","B","C")
##D data1 <- acomp(rnorm.acomp(100,Mcenter,Mvar))
##D data2 <- acomp(rbind(typicalData+rbinom(100,1,p=0.1)*rnorm(100)*acomp(c(4,1,1))))
##D data3 <- acomp(rbind(typicalData,acomp(c(0.5,1.5,2))))
##D colnames(data3)<-colnames(typicalData)
##D tmp<-set.seed(30)
##D rcauchy.acomp <- function (n, mean, var){
##D     D <- gsi.getD(mean)-1
##D     perturbe(ilrInv(matrix(rnorm(n*D)/rep(rnorm(n),D), ncol = D) %*% chol(clrvar2ilr(var))), mean)
##D }
##D data4 <- acomp(rcauchy.acomp(100,acomp(c(1,2,1)),Mvar/4))
##D colnames(data4)<-colnames(typicalData)
##D data5 <- acomp(rbind(unclass(typicalData)+outer(rbinom(100,1,p=0.1)*runif(100),c(0.1,1,2))))
##D data6 <- acomp(rbind(typicalData,rnorm.acomp(20,acomp(c(4,4,1)),Mvar)))
##D datas <- list(data1=data1,data2=data2,data3=data3,data4=data4,data5=data5,data6=data6)
##D tmp <-c()
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
##D 
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="ecdf",main=names(datas)[i])
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="portion",main=names(datas)[i])
##D par(mfrow=c(2,3),pch=19,mar=c(3,2,2,1))  
##D for( i in 1:length(datas) ) 
##D   outlierplot(datas[[i]],type="nout",main=names(datas)[i])
##D par(opar)
##D 
##D moreData <- acomp(rbind(data3,data5,data6))
##D take<-OutlierClassifier1(moreData,type="grade")!="ok"
##D hc<-hclust(dist(normalize(acomp(scale(moreData)[take,]))),method="complete")
##D plot(hc)
##D plot(acomp(moreData[take,]),col=cutree(hc,1.5))
## End(Not run)



