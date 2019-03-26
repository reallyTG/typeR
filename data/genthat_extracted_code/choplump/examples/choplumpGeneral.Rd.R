library(choplump)


### Name: choplumpGeneral
### Title: General choplump test
### Aliases: choplumpGeneral
### Keywords: htest

### ** Examples

### compare speed and results using two different functions
W<-c(0,0,0,0,0,0,0,0,2,4,6)
Z<-c(0,0,0,0,1,1,1,1,0,1,1)
Testfunc<-function(d){
     W<-d$W
     Z<-d$Z
     N<-length(Z)
     sqrt(N-1)*(sum(W*(1-Z)) - N*mean(W)*mean(1-Z) )/
       sqrt(var(W)*var(1-Z))
}
time0<-proc.time()
choplumpGeneral(W,Z,Testfunc)
time1<-proc.time()
choplump(W~Z,use.ranks=FALSE)$p.values
time2<-proc.time()
time1-time0
time2-time1



