library(dma)


### Name: dma
### Title: Dynamic model averaging for continuous outcomes
### Aliases: dma dma.default print.dma plot.dma coef.dma makf4
###   model.update3 rm.Kalman

### ** Examples

#simulate some data to test
#first, static coefficients
coef<-c(1.8,3.4,-2,3,-2.8,3)
coefmat<-cbind(rep(coef[1],200),rep(coef[2],200),
            rep(coef[3],200),rep(coef[4],200),
            rep(coef[5],200),rep(coef[6],200))
#then, dynamic ones
coefmat<-cbind(coefmat,seq(1,2.45,length.out=nrow(coefmat)),
            seq(-.75,-2.75,length.out=nrow(coefmat)),
            c(rep(-1.5,nrow(coefmat)/2),rep(-.5,nrow(coefmat)/2)))
npar<-ncol(coefmat)-1
dat<-matrix(rnorm(200*(npar),0,1),200,(npar))
ydat<-rowSums((cbind(rep(1,nrow(dat)),dat))[1:100,]*coefmat[1:100,])
ydat<-c(ydat,rowSums((cbind(rep(1,nrow(dat)),dat)*coefmat)[-c(1:100),c(6:9)]))
mmat<-matrix(c(c(1,0,1,0,0,rep(1,(npar-7)),0,0),
            c(rep(0,(npar-4)),rep(1,4)),rep(1,npar)),3,npar,byrow=TRUE)
dma.test<-dma(dat,ydat,mmat,lambda=.99,gamma=.99,initialperiod=20)
plot(dma.test)



