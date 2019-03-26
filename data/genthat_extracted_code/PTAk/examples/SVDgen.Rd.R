library(PTAk)


### Name: SVDgen
### Title: SVD with metrics and smoothing approximation
### Aliases: SVDgen
### Keywords: smooth multivariate

### ** Examples

#library(stats)
 #library(tensor)

 # on smoothing

 data(longley)
 long <- as.matrix(longley[,1:7])

 long.svd <- SVDgen(long,smoothing=FALSE)
  summary.PTAk(long.svd,testvar=0)
   # X11(width=4,height=4)
  plot.PTAk(long.svd,scree=TRUE,RiskJack=0,type="b",lty=3)

 long.svdo <- SVDgen(long,smoothing=TRUE,
  smoo=list(function(u)ksmooth(1:length(u),
      u,kernel="normal",bandwidth=3,x.points=(1:length(u)))$y,NA))

  summary.PTAk(long.svdo,testvar=0)
  #  X11(width=4,height=4)
  plot.PTAk(long.svdo,scree=TRUE,RiskJack=0,type="b",lty=3)
 ###using polynomial fitting
   polyfit <- function(u,deg=length(u)/5)
       {n <- length(u);time <- rep(1,n);
        for(e in 1:deg)time<-cbind(time,(1:n)^e);return(lm.fit(time,u)$fitted.values)}
bsfit<-function(u,deg=42)
       {n <- length(u);time <- rep(1,n);
        return(lm.fit(bs(time,df=deg),u)$fitted.values)}

###
 long.svdo2 <- SVDgen(long,nomb=4,smoothing=TRUE,smoo=list(polyfit,NA))
  long.svdo2[[1]]$v[1:3,]
long.svdo[[1]]$v[1:3,]
# orthogonality may be lost with non-projective smoother

     ####
comtoplot <- function(com=1,solua=long.svd,solub=long.svdo,openX11s=FALSE,...)
         {
  if(openX11s)X11(width=4,height=4)
 yla <- c(round((100*(solua[[2]]$d[com])^2)/
     solua[[2]]$ssX[1],4),
     round((100*(solub[[2]]$d[com])^2)/solua[[2]]$ssX[1],4))

limi <- range(c(solua[[1]]$v[com,],solub[[1]]$v[com,]))
  plot(solua,nb1=com, mod=1,type="b",lty=3,lengthlabels=4,cex=0.4,
   ylimit=limi,ylab="",...)
mtext(paste("vs",com,":",yla[1],"%"),2,col=2,line=2)
 par(new=TRUE)

  plot.PTAk(solub,nb1=com,mod=1,labels=FALSE,type="b",lty=1,
  lengthlabels=4,cex=0.6,ylimit=limi,ylab="",main=paste("smooth vs",com,":",yla[2],"%"),...)
  par(new=FALSE)
}   ####
 comtoplot(com=1)



#  on using non-diagonal metrics

 data(crimerate)
  crimerate.mat <- sweep(crimerate,2,apply(crimerate,2,mean))
  crimerate.mat <- sweep(crimerate.mat,2,sqrt(apply(crimerate.mat,2,var)),FUN="/")
   metW <- Powmat(CauRuimet(crimerate.mat),(-1))
   # inverse of the within "group" (to play a bit more you could set m0 relating
   # the neighbourhood of states (see CauRuimet)

  cri.svd <- SVDgen(crimerate.mat,D2=1,D1=1)
  summary(cri.svd,testvar=0)
   plot(cri.svd,scree=TRUE,RiskJack=4,type="b",lty=3)
  cri.svdo <- SVDgen(crimerate.mat,D2=metW,D1=1)
   summary(cri.svdo,testvar=0)
   plot(cri.svdo,scree=TRUE,RiskJack=5,type="b",lty=3)
  # X11(width=8,height=4)
  par(mfrow=c(1,2))
   plot(cri.svd,nb1=1,nb2=2,mod=1,lengthlabels=3)
  plot(cri.svd,nb1=1,nb2=2,mod=2,lengthlabels=4,main="canonical")
  # X11(width=8,height=4)
  par(mfrow=c(1,2))
 plot(cri.svdo,nb1=1,nb2=2,mod=1,lengthlabels=3)
 plot(cri.svdo,nb1=1,nb2=2,mod=2,lengthlabels=4,
       main=expression(paste("metric ",Wg^{-1})))

###########
#  demo function
 # when ima is NULL it uses the dataset timage12 but you can put any array
 # demo.SVDgen(ima=NULL,snr=3,openX11s=TRUE)  

    


