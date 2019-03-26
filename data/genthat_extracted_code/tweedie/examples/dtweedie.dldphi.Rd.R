library(tweedie)


### Name: dtweedie.dldphi
### Title: Tweedie Distributions
### Aliases: dtweedie.dldphi dtweedie.dldphi.saddle
### Keywords: models

### ** Examples

### Plot dl/dphi against candidate values of phi
power <- 2
mu <- 1 
phi <- seq(2, 8, by=0.1)

set.seed(10000) # For reproducability
y <- rtweedie( 100, mu=mu, power=power, phi=3)
   # So we expect the maximum to occur at  phi=3

dldphi <- dldphi.saddle <- array( dim=length(phi))

for (i in (1:length(phi))) {
   dldphi[i] <- dtweedie.dldphi( y=y, power=power, mu=mu, phi=phi[i]) 
   dldphi.saddle[i] <- dtweedie.dldphi.saddle( y=y, power=power, mu=mu, phi=phi[i]) 
}

plot( dldphi ~ phi, lwd=2, type="l",
   ylab=expression(phi), xlab=expression(paste("dl / d",phi) ) )
lines( dldphi.saddle ~ phi, lwd=2, col=2, lty=2)
legend( "bottomright", lwd=c(2,2), lty=c(1,2), col=c(1,2),
   legend=c("'Exact' (using series)","Saddlepoint") )

# Neither are very good in this case!
   



