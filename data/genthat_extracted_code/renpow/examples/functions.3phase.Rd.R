library(renpow)


### Name: three-phase
### Title: Three-phase generator
### Aliases: generator
### Keywords: hplot dplot math

### ** Examples


x <- list(S3p = 15*10^6, Vl.rms = 13.8*10^3, pf=0.85, lead.lag=-1, Zs.r = c(0.1,2))
generator(x)

x <- list(S3p = 15*10^6, Vl.rms = 13.8*10^3, pf=0.85, lead.lag=1, Zs.r = c(0.1,2))
generator(x)




