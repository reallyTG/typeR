library(ecosim)


### Name: randnorm
### Title: Sample from a Univariate Normal or Lognormal Distribution
### Aliases: randnorm

### ** Examples

n <- 10000

samp <- randnorm(mean=0,sd=1,n=n)
plot(1:length(samp),samp,xlab="index",ylab="y",cex=0.2)
mean(samp)
sd(samp)

samp <- randnorm(mean=2,sd=2,log=TRUE,n=n)
plot(1:length(samp),samp,ylim=c(0,25),xlab="index",ylab="y",cex=0.2)
mean(samp)
sd(samp)



