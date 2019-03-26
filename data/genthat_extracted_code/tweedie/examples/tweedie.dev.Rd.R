library(tweedie)


### Name: tweedie.dev
### Title: Tweedie Distributions: the deviance function
### Aliases: tweedie.dev
### Keywords: models

### ** Examples

### Plot a Tweedie deviance function when 1<p<2
mu <- 1 

y <- seq(0, 6, length=100) 

dev1 <- tweedie.dev( y=y, mu=mu, power=1.1) 
dev2 <- tweedie.dev( y=y, mu=mu, power=1.5)
dev3 <- tweedie.dev( y=y, mu=mu, power=1.9) 

plot(range(y), range( c(dev1, dev2, dev3)), 
   type="n", lwd=2, ylab="Deviance", xlab=expression(italic(y)) )

lines( y, dev1, lty=1, col=1, lwd=2 )
lines( y, dev2, lty=2, col=2, lwd=2 )
lines( y, dev3, lty=3, col=3, lwd=2 )


legend("top", col=c(1,2,3), lwd=c(2,2,2), lty=c(1,2,3),
    legend=c("p=1.1","p=1.5", "p=1.9") )


### Plot a Tweedie deviance function when p>2
mu <- 1 

y <- seq(0.1, 6, length=100) 

dev1 <- tweedie.dev( y=y, mu=mu, power=2) # Gamma
dev2 <- tweedie.dev( y=y, mu=mu, power=3) # Inverse Gaussian
dev3 <- tweedie.dev( y=y, mu=mu, power=4) 

plot(range(y), range( c(dev1, dev2, dev3)), 
   type="n", lwd=2, ylab="Deviance", xlab=expression(italic(y)) )

lines( y, dev1, lty=1, col=1, lwd=2 )
lines( y, dev2, lty=2, col=2, lwd=2 )
lines( y, dev3, lty=3, col=3, lwd=2 )


legend("top", col=c(1,2,3), lwd=c(2,2,2), lty=c(1,2,3),
    legend=c("p=2 (gamma)", "p=3 (inverse Gaussian)", "p=4") )




