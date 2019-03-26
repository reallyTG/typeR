library(meteR)


### Name: logLikZ
### Title: Compute log-likelihood z-score
### Aliases: logLikZ logLikZ.meteDist

### ** Examples

data(arth)
## object holding ecosystem structure function
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(.75),
                minE=min(arth$mass^(.75)))
## calculate individual power distribution
ipd1 <- ipd(esf1)
## calculate z-score, keeping all simulated log likelihoods for plotting
llz <- logLikZ(ipd1, nrep=100, return.sim=TRUE)

plot(density(llz$sim),xlim=range(c(llz$sim,llz$obs)),
     xlab='scaled log(likelihood)^2',col='red')
abline(v=llz$z,lty=2)
legend('top',legend=c('data','simulated'),col=c('black','red'),
      lty=c(1,1),bty='n')



