library(bayess)


### Name: gibbs
### Title: Gibbs sampler and Chib's evidence approximation for a generic
###   univariate mixture of normal distributions
### Aliases: gibbs
### Keywords: Gibbs mixture evidence Bayes factor

### ** Examples

faithdata=faithful[,1]
mu=rnorm(3,mean=mean(faithdata),sd=sd(faithdata)/10)
sig=1/rgamma(3,shape=10,scale=var(faithdata))
mix=list(k=3,p=rdirichlet(par=rep(1,3)),mu=mu,sig=sig)
resim3=gibbs(100,faithdata,mix)
lulu=order(resim3$lolik)[100]
lnum1=resim3$lolik[lulu]
lnum2=sum(dnorm(resim3$mu[lulu,],mean=mean(faithdata),sd=resim3$sig[lulu,],log=TRUE)+
dgamma(resim3$sig[lulu,],10,var(faithdata),log=TRUE)-2*log(resim3$sig[lulu,]))+
sum((rep(0.5,mix$k)-1)*log(resim3$p[lulu,]))+
lgamma(sum(rep(0.5,mix$k)))-sum(lgamma(rep(0.5,mix$k)))
lchibapprox3=lnum1+lnum2-log(resim3$deno)



