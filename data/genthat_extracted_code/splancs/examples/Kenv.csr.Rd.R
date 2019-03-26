library(splancs)


### Name: Kenv.csr
### Title: Envelope of Khat from simulations of complete spatial randomness
### Aliases: Kenv.csr
### Keywords: spatial

### ** Examples

data(cardiff)
UL.khat <- Kenv.csr(length(cardiff$x), cardiff$poly, nsim=29, seq(2,30,2))
plot(seq(2,30,2), sqrt(khat(as.points(cardiff), cardiff$poly, 
seq(2,30,2))/pi)-seq(2,30,2), type="l", xlab="Splancs - polygon boundary", 
ylab="Estimated L", ylim=c(-1,1.5))
lines(seq(2,30,2), sqrt(UL.khat$upper/pi)-seq(2,30,2), lty=2)
lines(seq(2,30,2), sqrt(UL.khat$lower/pi)-seq(2,30,2), lty=2)



