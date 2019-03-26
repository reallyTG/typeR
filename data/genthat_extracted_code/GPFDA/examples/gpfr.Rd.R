library(GPFDA)


### Name: gpfr
### Title: Gaussian Process in functional data.
### Aliases: gpfr

### ** Examples

library(GPFDA)

traindata=vector('list',20)
for(i in 1:20) traindata[[i]]=i
n=50
traindata=lapply(traindata,function(i) {
  x=seq(-3,3,len=n)
  y=sin(x^2)-x+0.2*rnorm(n,runif(1,-3,3),runif(1,0.5,3))
  x1=0.5*x^3+exp(x)+rnorm(n,runif(1,-3,3),runif(1,0.5,5))
  x2=cos(x^3)+0.2*rnorm(n,runif(1,-3,3),runif(1,0.5,5))
  mat=cbind(x,x1,x2,y)
  colnames(mat)=c('time','x1','x2','y')
  scale=t(c(2*(mean(y)>0.25)-1,(var(y)>3.6)*2-1,(sd(y)-sd(x)>1.4)*2-1))
  i=list(mat,scale)
})

lx=do.call('rbind',lapply(traindata,function(i)i[[2]]))
fx1=do.call('rbind',lapply(traindata,function(i)i[[1]][,2]))
fx2=do.call('rbind',lapply(traindata,function(i)i[[1]][,3]))
fy1=do.call('rbind',lapply(traindata,function(i)i[[1]][,4]))
time_old=traindata[[1]][[1]][,1]

## comment out because running time is a bit long
# system.time(a1<-gpfr(response=(fy1),lReg=lx,fReg=NULL,gpReg=list(fx1,fx2)
#                ,fyList=list(nbasis=23,lambda=0.1),fbetaList_l=
#                list(list(lambda=.01,nbasi=17)),hyper=NULL,
#                Cov=c('pow.ex','linear'),fitting=TRUE,
#                time=seq(-3,3,len=50),rPreIdx=TRUE,concurrent=TRUE))




