library(waveslim)


### Name: Spectral Density Functions
### Title: Spectral Density Functions for Long-Memory Processes
### Aliases: fdp.sdf spp.sdf spp2.sdf sfd.sdf
### Keywords: ts

### ** Examples

dB <- function(x) 10 * log10(x)

fdp.main <- expression(paste("FD", group("(",d==0.4,")")))
sfd.main <- expression(paste("SFD", group("(",list(s==12, d==0.4),")")))
spp.main <- expression(paste("SPP",
    group("(",list(delta==0.4, f[G]==1/12),")")))

freq <- 0:512/1024

par(mfrow=c(2,2), mar=c(5-1,4,4-1,2), col.main="darkred")
plot(freq, dB(fdp.sdf(freq, .4)), type="l", xlab="frequency",
     ylab="spectrum (dB)", main=fdp.main)
plot(freq, dB(spp.sdf(freq, .4, 1/12)), type="l", xlab="frequency",
     ylab="spectrum (dB)", font.main=1, main=spp.main)
plot(freq, dB(sfd.sdf(freq, 12, .4)), type="l", xlab="frequency",
     ylab="spectrum (dB)", main=sfd.main)



