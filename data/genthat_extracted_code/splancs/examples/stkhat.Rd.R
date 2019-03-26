library(splancs)


### Name: stkhat
### Title: Space-time K-functions
### Aliases: stkhat
### Keywords: spatial

### ** Examples

data(burkitt)
bur1 <- stkhat(burpts, burkitt$t, burbdy, c(400, 5800),
  seq(1,40,2), seq(100, 1500, 100))
oldpar <- par(mfrow=c(2,1))
plot(bur1$s, bur1$ks, type="l", xlab="distance", ylab="Estimated K",
  main="spatial K function")
plot(bur1$t, bur1$kt, type="l", xlab="time", ylab="Estimated K",
  main="temporal K function")
par(oldpar)



