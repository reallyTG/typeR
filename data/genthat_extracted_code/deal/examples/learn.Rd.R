library(deal)


### Name: learn
### Title: Estimation of parameters in the local probability distributions
### Aliases: learn
### Keywords: iplot

### ** Examples

data(rats)
fit       <- network(rats)
fit.prior <- jointprior(fit,12)
fit.learn <- learn(fit,rats,fit.prior,timetrace=TRUE)
fit.nw    <- getnetwork(fit.learn)
fit.learn2<- learn(fit,rats,fit.prior,trylist=gettrylist(fit.learn),timetrace=TRUE)



