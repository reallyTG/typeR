library(hbmem)


### Name: sampleSig2
### Title: Function sampleSig2
### Aliases: sampleSig2

### ** Examples

library(hbmem)
true.mean=c(0,0)
true.sigma2=c(10,20)
N=2
I=1
J=1
R=1000
cond=rep(0:1,R/2)
ncond=table(cond)
sub=rep(0,R)
item=rep(0,R)
lag=rep(0,R)

#make some data
dat=rnorm(R,true.mean[cond+1],sqrt(true.sigma2[cond+1]))
true.block=c(true.mean,rep(0,(I+J+3)))

a=b=.01

M=10
s.sigma2=matrix(1,M,N)

for(m in 2:M)
{
s.sigma2[m,]=sampleSig2(s.sigma2[m-1,],true.block,dat,cond,sub,item,lag,N,
ncond,I, J,a,b)
}

par(mfrow=c(1,1),pty='s')

matplot(s.sigma2,t='l')

abline(h=true.sigma2,col="blue")
abline(h=colMeans(s.sigma2),col="green") #post mean




