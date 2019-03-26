library(medfate)


### Name: hydrology.rainInterception
### Title: Rainfall interception
### Aliases: hydrology.rainInterception

### ** Examples

throughfallMatrixGash<-function(P = seq(1,50, by=1), Cm = seq(1,5, by=1), 
                                ER = 0.08,p=0.8) {
  m2<- P - hydrology.rainInterception(P,Cm[1],p,ER=ER)
  for(i in 2:length(Cm)) {
    m2<-rbind(m2,P-hydrology.rainInterception(P,Cm[i],p,ER=ER))
  }
  colnames(m2)<-P
  rownames(m2)<-Cm
  return(m2)
}

Cm = c(0.5,seq(1,4, by=1))
P = seq(1,50, by=1)

m2 = throughfallMatrixGash(P=P, p=0.2, Cm=Cm,ER = 0.05)
rt = sweep(m2,2,P,"/")*100
matplot(t(rt), type="l", axes=TRUE, ylab="Relative throughfall (%)", 
        xlab="Gross rainfall (mm)", xlim=c(0,length(P)), 
        lty=1:length(Cm), col="black", ylim=c(0,100))
title(main="p = 0.2 E/R = 0.05")
legend("bottomright",lty=1:length(Cm), legend=paste("Cm =",Cm), bty="n")




