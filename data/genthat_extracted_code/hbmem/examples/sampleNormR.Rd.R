library(hbmem)


### Name: sampleNormR
### Title: Function sampleNormR
### Aliases: sampleNormR

### ** Examples

library(hbmem)

I=50
J=100
M=10
B=I+J+4
mu=.5
muS2=0
s2a=.2
s2b=.2
s2aS2=0
s2bS2=0

phi=c(.2,.08)
blockD=rep(0,B)
blockD[2:(I+1)]=rnorm(I,0,.5)
blockD[(I+2):(I+J+1)]=rnorm(J,0,.5)

    R = I * J
    alpha = rnorm(I, phi[1]*blockD[2:(I+1)], sqrt(s2a))
    beta =  rnorm(J, phi[2]*blockD[(I+2):(I+J+1)], sqrt(s2b))
    alphaS2 = rnorm(I, 0, sqrt(s2aS2))
    betaS2 = rnorm(J, 0, sqrt(s2bS2))
    subj = rep(0:(I - 1), each = J)
    item = rep(0:(J - 1), I)
    lag = rep(0, R)
    resp = 1:R
    for (r in 1:R) {
        mean = mu + alpha[subj[r] + 1] + beta[item[r] + 1]
        sd = sqrt(exp(muS2 + alphaS2[subj[r] + 1] + betaS2[item[r] + 1]))
        resp[r] = rnorm(1, mean, sd)
    }
    sim=(as.data.frame(cbind(subj, item, lag, resp)))



blockR=matrix(0,M,B)
blockR[1,c(I+J+2,I+J+3)]=c(.1,.1)
met=c(.1,.1)
b0=c(0,0)

for(m in 2:M)
  {
tmp=sampleNormR(blockR[m-1,],phi,blockD,sim$resp,sim$subj,sim$item,sim$lag,
I,J,I*J,table(sim$sub),table(sim$item),10,.01,.01,met[1],met[2],1,1)
blockR[m,]=tmp[[1]]
b0=b0+tmp[[3]]
}

est=colMeans(blockR)

par(defpar(2,3))
plot(blockR[,1],t='l')
abline(h=mu,col="blue")
plot(blockR[,I+J+2],t='l')
abline(h=s2a,col="blue")
plot(blockR[,I+J+3],t='l')
abline(h=s2b,col="blue")

plot(est[2:(I+1)]~alpha);abline(0,1,col="blue")
plot(est[(I+2):(I+J+1)]~beta);abline(0,1,col="blue")

#Compare estimates from regular normal ones:

s.block=matrix(0,nrow=M,ncol=B)
met=c(.1,.1);b0=c(0,0)
for(m in 2:M)
{
tmp=sampleNorm(s.block[m-1,],sim$resp,rep(0,length(sim$resp)),sim$subj,
sim$item,sim$lag,1,I,J,R,R,table(sim$subj),
table(sim$item),100,.01,.01,met[1],met[2],1,1)
s.block[m,]=tmp[[1]]
b0=b0 + tmp[[2]]
}

est2=colMeans(s.block)

par(defpar(1,2))
plot(est[2:(I+1)]~est2[2:(I+1)]);abline(0,1,col="blue")
plot(est[(I+2):(I+J+1)]~est2[(I+2):(I+J+1)]);abline(0,1,col="blue")






