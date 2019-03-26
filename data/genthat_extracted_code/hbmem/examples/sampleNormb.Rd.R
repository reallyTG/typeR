library(hbmem)


### Name: sampleNormb
### Title: Function sampleNormb
### Aliases: sampleNormb

### ** Examples

library(hbmem)
N=2
I=50
J=200
B=N+I+J+3
R = I * J

mu=c(3,5)
muS2=log(c(1,2))
alpha = rnorm(I, 0, sqrt(.2))
beta = rnorm(J, 0, sqrt(.2))
alphaS2 = rnorm(I, 0, sqrt(.2))
betaS2 = rnorm(J, 0, sqrt(.2))
cond=sample(0:(N-1),R,replace=TRUE)
subj = rep(0:(I - 1), each = J)
item = rep(0:(J - 1), I)
lag = rep(0, R)
lag=runif(R,-500,500)
lag=lag-mean(lag)
resp = 1:R
for (r in 1:R) {
    mean = mu[cond[r] + 1] + alpha[subj[r] + 1] + beta[item[r] + 1]
    sd = sqrt(exp(muS2[cond[r]+1] + alphaS2[subj[r] + 1] +
betaS2[item[r] + 1] + .005*lag[r]))
    resp[r] = rnorm(1, mean, sd)
}
sim=(as.data.frame(cbind(cond,subj, item, lag, resp)))
attach(sim)
plot(resp~lag)

########MCMC SETUP##########
blockS=blockS2=matrix(0,nrow=10,ncol=B)
blockS[,B-1]=blockS[,B-2]=blockS2[,B-1]=blockS2[,B-2]=.5
b0mean=c(0,0)
b0S2=rep(0,B)
met=rep(.01,B)
jump=.0001
ncond=table(cond)
nsub=table(subj)
nitem=table(item)

for(m in 2:10) #way to low for real analysis
  {
    tmp=sampleNormb(blockS[m-1,],resp,cond,subj,item,lag,N,I,J,I*J,
ncond,nsub,nitem,10,.01,.01,.02,.005,blockS2[m-1,],1,1)
    blockS[m,]=tmp[[1]]
    b0mean=b0mean+tmp[[2]]
    
    tmp=sampleSig2b(blockS2[m-1,],resp,cond,subj,item,lag,N,I,J,I*J,
ncond,nsub,nitem,10,.01,.01,met,blockS[m,],1,1)
    blockS2[m,]=tmp[[1]]
    b0S2=b0S2+tmp[[2]]
   if(m<10) met=met+(b0S2/m<.3)*-jump +(b0S2/m>.5)*jump
    met[met<jump]=jump
#met[B]=.0001
  }
b0mean/m
b0S2/m

s=colMeans(blockS)
s2=colMeans(blockS2)

par(mfrow=c(3,3))
matplot(blockS[,1:N],t='l')
abline(h=mu)
plot(s[(N+1):(I+N)]~alpha);abline(0,1)
plot(s[(I+N+1):(I+J+N)]~beta);abline(0,1)

matplot(blockS2[,1:N],t='l')
abline(h=muS2)
plot(s2[(N+1):(I+N)]~alphaS2);abline(0,1)
plot(s2[(I+N+1):(I+N+J)]~betaS2);abline(0,1)

plot(blockS2[,B-2],t='l')
plot(blockS2[,B-1],t='l')
plot(blockS2[,B],t='l')




