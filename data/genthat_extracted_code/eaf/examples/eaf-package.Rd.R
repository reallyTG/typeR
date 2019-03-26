library(eaf)


### Name: eaf-package
### Title: Plots of the Empirical Attainment Function
### Aliases: eaf-package _PACKAGE eaf
### Keywords: graphs package

### ** Examples

data(gcp2x2)
tabucol<-subset(gcp2x2, alg!="TSinN1")
tabucol$alg<-tabucol$alg[drop=TRUE]
eafplot(time+best~run,data=tabucol,subset=tabucol$inst=="DSJC500.5")

eafplot(time+best~run|inst,groups=alg,data=gcp2x2)
eafplot(time+best~run|inst,groups=alg,data=gcp2x2,
percentiles=c(0,50,100),include.extremes=TRUE,
cex=1.4, lty=c(2,1,2),lwd=c(2,2,2),
       col=c("black","blue","grey50"))

A1<-read.data.sets(file.path(system.file(package="eaf"),"extdata","ALG_1_dat"))
A2<-read.data.sets(file.path(system.file(package="eaf"),"extdata","ALG_2_dat"))
eafplot(A1,A2, percentiles=c(50))
eafplot(list(A1=A1, A2=A2), percentiles=c(50))
eafdiffplot(A1, A2)
## Save to a PDF file
# dev.copy2pdf(file="eaf.pdf", onefile=TRUE, width=5, height=4)




