library(hbmem)


### Name: samplePosNorm
### Title: Function samplePosNorm
### Aliases: samplePosNorm

### ** Examples

library(hbmem)

N=3
I=50
J=100
R=N*I*J
t.sigma2=3
t.mu=c(-1,0,1)
t.sig2alpha=.2
t.sig2beta=.6
t.alpha=rnorm(I,0,sqrt(t.sig2alpha))
t.beta =rnorm(J,0,sqrt(t.sig2beta))
t.theta=-.5
cond=sample((0:(N-1)),R,replace=TRUE)
sub=rep(rep(0:(I-1),each=J),N)
item=rep(rep(0:(J-1),I),N)
lag=scale(rnorm(R,0,sqrt(t.sigma2)/10))

tmean=1:R
for(r in 1:R) tmean[r]=exp(t.mu[cond[r]+1]+t.alpha[sub[r]+1]+t.beta[item[r]+1]+t.theta*lag[r])
y=rnorm(R,tmean,sqrt(t.sigma2))

M=10 #Way too low for real analysis!
B=N+I+J+3
block=matrix(0,nrow=M,ncol=B)
met=rep(.1,B);jump=.0001
b0=rep(0,B)
keep=2:M
for(m in 2:M)
{
  tmp= samplePosNorm(block[m-1,],y,cond,sub,item,lag,N,I,J,R,1,.01,.01,met,t.sigma2,1)
  block[m,]=tmp[[1]]
  b0=b0+tmp[[2]]

  if(m<keep[1])
  {
   met=met+(b0/m<.3)*-jump +(b0/m>.5)*jump
   met[met<jump]=jump
  }
      #if(m%%100==0) print(m)
}

est=colMeans(block[keep,])
b0/M

par(mfrow=c(3,2))
est.mu=est[1:N]
matplot(exp(block[keep,1:N]),t='l',main="Mu",ylab="Mu")
abline(h=exp(t.mu),col="blue")
#abline(h=tapply(y,cond,mean),col="green")
acf(block[keep,1],main="ACF of Mu")

est.alpha=est[(N+1):(N+I)]
plot(est.alpha~t.alpha,ylab="Est. Alpha",xlab="True Alpha");abline(0,1)
est.beta=est[(N+I+1):(N+I+J)]
plot(est.beta~t.beta,ylab="Est. Beta",xlab="True Beta");abline(0,1)

est.theta=est[N+I+J+3]
plot(block[keep,(N+I+J+3)],t='l',main="Theta",ylab="Theta")
abline(h=t.theta,col="blue")

plot(density(block[keep,(N+I+J+1)]),col="red",main="Posterior of Variances",xlim=c(0,1))
abline(v=t.sig2alpha,col="red")
lines(density(block[keep,(N+I+J+2)]),col="blue")
abline(v=t.sig2beta,col="blue")







