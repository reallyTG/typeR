library(splancs)


### Name: Kenv.label
### Title: Envelope of K1hat-K2hat from random labelling of two point
###   patterns
### Aliases: Kenv.label
### Keywords: spatial

### ** Examples

data(okwhite)
data(okblack)
okpoly <- list(x=c(okwhite$x, okblack$x), y=c(okwhite$y, okblack$y))
K1.hat <- khat(as.points(okwhite), bboxx(bbox(as.points(okpoly))), seq(5,80,5))
K2.hat <- khat(as.points(okblack), bboxx(bbox(as.points(okpoly))), seq(5,80,5))
K.diff <- K1.hat-K2.hat
plot(seq(5,80,5), K.diff, xlab="distance", ylab=expression(hat(K)[1]-hat(K)[2]), 
ylim=c(-11000,7000), type="l", main="Simulation envelopes, random labelling")
env.lab <- Kenv.label(as.points(okwhite), as.points(okblack), 
bboxx(bbox(as.points(okpoly))), nsim=29, s=seq(5,80,5))
lines(seq(5,80,5), env.lab$upper, lty=2)
lines(seq(5,80,5), env.lab$lower, lty=2)



