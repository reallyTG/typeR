library(mixtools)


### Name: density.npEM
### Title: Normal kernel density estimate for nonparametric EM output
### Aliases: density.npEM
### Keywords: file

### ** Examples
 
## Look at histogram of Old Faithful waiting times
data(faithful)
Minutes <- faithful$waiting
hist(Minutes, freq=FALSE)

## Superimpose equal-variance normal mixture fit:
set.seed(100)
nm <- normalmixEM(Minutes, mu=c(50,80), sigma=5, arbvar=FALSE, fast=TRUE)
x <- seq(min(Minutes), max(Minutes), len=200)
for (j in 1:2) 
  lines(x, nm$lambda[j]*dnorm(x, mean=nm$mu[j], sd=nm$sigma), lwd=3, lty=2)
  
## Superimpose several semiparametric fits with different bandwidths:
bw <- c(1, 3, 5)
for (i in 1:3) {
  sp <- spEMsymloc(Minutes, c(50,80), bw=bw[i], eps=1e-3)
  for (j in 1:2) 
    lines(density(sp, component=j, scale=TRUE), col=1+i, lwd=2)    
}
legend("topleft", legend=paste("Bandwidth =",bw), fill=2:4)



