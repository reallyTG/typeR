library(benchden)


### Name: dberdev
### Title: 28 benchmark densities from Berlinet/Devroye (1994)
### Aliases: dberdev pberdev qberdev rberdev
### Keywords: distribution datagen nonparametric

### ** Examples


# histogram and true density of "Claw"-distribution
hist(rberdev(1000,dnum=23),breaks=100, main = " ",freq=FALSE)
lines(seq(-3,3,0.01),dberdev(seq(-3,3,0.01),dnum=23),col="blue",lwd=2)
title(paste(nberdev(dnum=23)))

# plot cdf of simulated data and the df of "Matterhorn"-distribution
plot.stepfun(rberdev(100,dnum=14),do.points=TRUE,main="")
lines(seq(-1,1,0.001),pberdev(seq(-1,1,0.001),dnum=14),col="blue")
title(paste(nberdev(dnum=14)))

# plot quantiles of "smooth comb"-distribution
plot(qberdev(seq(0,1,0.01),dnum=24),t="l")
title(paste(nberdev(dnum=24)))




