library(hbmem)


### Name: sampleGamma
### Title: Function sampleGamma
### Aliases: sampleGamma

### ** Examples

library(hbmem)
N=2
shape=2
I=30
J=50
R=I*J
#make some data
mu=log(c(1,2))
alpha=rnorm(I,0,.2)
beta=rnorm(J,0,.2)
theta=-.001
cond=sample(0:(N-1),R,replace=TRUE)
subj=rep(0:(I-1),each=J)
item=NULL
for(i in 1:I)
item=c(item,sample(0:(J-1),J,replace=FALSE))
lag=rnorm(R,0,100)
lag=lag-mean(lag)
resp=1:R
for(r in 1:R)
{
  scale=1+exp(mu[cond[r]+1]+alpha[subj[r]+1]+beta[item[r]+1]+theta*lag[r])
  resp[r]=rgamma(1,shape=shape,scale=scale)
}

ncond=table(cond)
nsub=table(subj)
nitem=table(item)

M=10
keep=2:M
B=N+I+J+3
s.block=matrix(0,nrow=M,ncol=B)
met=rep(.08,B)
b0=rep(0,B)
jump=.0005
for(m in 2:M)
{
tmp=sampleGamma(s.block[m-1,],resp,cond,subj,item,lag,
N,I,J,R,ncond,nsub,nitem,5,.01,.01,met,2,1,pos=TRUE)
s.block[m,]=tmp[[1]]
b0=b0 + tmp[[2]]
#Auto-tuning of metropolis decorrelating steps 
if(m>20 & m<min(keep))
  {
    met=met+(b0/m<.4)*rep(-jump,B) +(b0/m>.6)*rep(jump,B)
    met[met<jump]=jump 
  }
if(m==min(keep)) b0=rep(0,B)
}

b0/length(keep) #check acceptance rate

hbest=colMeans(s.block[keep,])

par(mfrow=c(2,2),pch=19,pty='s')
matplot(s.block[keep,1:N],t='l')
abline(h=mu,col="green")
acf(s.block[keep,1])
plot(hbest[(N+1):(I+N)]~alpha)
abline(0,1,col="green")
plot(hbest[(I+N+1):(I+J+N)]~beta)
abline(0,1,col="green")



#variance of participant effect
mean(s.block[keep,(N+I+J+1)])
#variance of item effect
mean(s.block[keep,(N+I+J+2)])
#estimate of lag effect
mean(s.block[keep,(N+I+J+3)])




