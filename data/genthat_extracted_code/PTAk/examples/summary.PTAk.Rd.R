library(PTAk)


### Name: summary.PTAk
### Title: Summary of a PTA-k modes analysis
### Aliases: summary.PTAk summary.FCAk
### Keywords: array algebra multivariate

### ** Examples

 data(crimerate)
 crimerate.mat <- sweep(crimerate,2,apply(crimerate,2,mean))
 crimerate.mat <- sweep(crimerate.mat,2,sqrt(apply(crimerate,2,var)),FUN="/")
 cri.svd <- SVDgen(crimerate.mat)
 summary(cri.svd,testvar=0)
  plot(cri.svd,scree=TRUE)
  par(new=TRUE)
  RiskJackplot(cri.svd,nbvs=1:7,mod=NULL,max=NULL,rescaled=TRUE,
        axes=FALSE,ann=FALSE)
  par(new=FALSE)

  # or equivalently

  plot(cri.svd,scree=TRUE,type="b",lty=3,RiskJack=1) #set mod=NULL or c(1,2)
  ###
   data(crimerate)
   criafc <- FCAmet(crimerate,chi2=TRUE)
   cri.afc <- SVDgen(criafc$data,criafc$met[[2]],criafc$met[[1]])
    summary(cri.afc)
   plot(cri.afc,scree=TRUE)
   plot(cri.afc,scree=TRUE,type="b",lty=3,RiskJack=1,method="FCA")


   


