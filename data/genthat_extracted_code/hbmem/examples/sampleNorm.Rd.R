library(hbmem)


### Name: sampleNorm
### Title: Function sampleNorm
### Aliases: sampleNorm

### ** Examples

library(hbmem)
N=2
t.mu=c(1,2)
I=20
J=50
R=I*J
#make some data
tmp=normalSim(N=N,I=I,J=J,mu=t.mu,s2a=2,s2b=2,muS2=log(1),s2aS2=0,s2bS2=0)
dat=tmp[[1]]
t.alpha=tmp[[2]]
t.beta=tmp[[3]]

ncond=table(dat$cond)
nsub=table(dat$sub)
nitem=table(dat$item)

M=10
keep=2:M
B=N+I+J+3
s.block=matrix(0,nrow=M,ncol=B)
met=c(.1,.1);b0=c(0,0)
jump=.001
for(m in 2:M)
{
tmp=sampleNorm(s.block[m-1,],dat$resp,dat$cond,dat$subj,dat$item,dat$lag,
N,I,J,R,ncond,nsub,nitem,5,.01,.01,met[1],met[2],1,1,1)
s.block[m,]=tmp[[1]]
b0=b0 + tmp[[2]]


#Auto-tuning of metropolis decorrelating steps 
if(m>20 & m<min(keep))
  {
    met=met+(b0/m<.2)*c(-jump,-jump) +(b0/m>.3)*c(jump,jump)
    met[met<jump]=jump
  }
}

b0/M #check acceptance rate

hbest=colMeans(s.block[keep,])

par(mfrow=c(2,2),pch=19,pty='s')
matplot(s.block[keep,1:N],t='l')
abline(h=t.mu,col="green")
abline(h=tapply(dat$resp,dat$cond,mean),col="orange")
acf(s.block[keep,1])
plot(hbest[(N+1):(I+N)]~t.alpha)
abline(0,1,col="green")
plot(hbest[(I+N+1):(I+J+N)]~t.beta)
abline(0,1,col="green")



#variance of participant effect
mean(s.block[keep,(N+I+J+1)])
#variance of item effect
mean(s.block[keep,(N+I+J+2)])
#estimate of lag effect
mean(s.block[keep,(N+I+J+3)])




