library(PTAk)


### Name: CauRuimet
### Title: Robust estimation of within group varinace-covariance
### Aliases: CauRuimet
### Keywords: robust multivariate

### ** Examples


 data(iris)
  iris2 <- as.matrix(iris[,1:4])
  dimnames(iris2)[[1]] <- as.character(iris[,5])

 D2 <- CauRuimet(iris2,ker=1,withingroup=TRUE)
 D2 <- Powmat(D2,(-1))
 iris2 <- sweep(iris2,2,apply(iris2,2,mean))
 res <- SVDgen(iris2,D2=D2,D1=1)
 plot(res,nb1=1,nb2=2,cex=0.5)
 summary(res,testvar=0)

 # the same in a demo function
 # source(paste(R.home(),"/library/PTAk/demo/CauRuimet.R",sep=""))
 # demo.CauRuimet(ker=4,withingroup=TRUE,openX11s=FALSE)
 # demo.Cauruimet(ker=0.15,withingroup=FALSE,openX11s=FALSE)



