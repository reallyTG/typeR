library(acid)


### Name: confband.kneib
### Title: Simultaneous Confidence Bands
### Aliases: confband.kneib

### ** Examples

mu<-1:20
n<-1000
mcmc<-matrix(NA,n,20)
for(i in 1:20){
  mcmc[,i]<- rnorm(n,mu[i],sqrt(i))
}

plot(mu,type="l",ylim=c(-10,30),lwd=3)
lines(confband.pw(mcmc)$lower,lty=2)
lines(confband.pw(mcmc)$upper,lty=2)
lines(confband.kneib(mcmc)$lower,lty=3)
lines(confband.kneib(mcmc)$upper,lty=3)




