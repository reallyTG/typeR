library(STAND)


### Name: ple.plot
### Title: Plot PLE With Confidence Limits
### Aliases: ple.plot
### Keywords: hplot

### ** Examples

data(beTWA)
par( mfrow=c(1,2) )
ple.plot(beTWA)  #  plot the PLE of F(x) for the beTWA data
ple.plot(beTWA,ylow=0.8) #  plot the upper right tail 
# Lognormal ML estimates of 95th percentile and CLs
unlist(percentile.ml(beTWA))
# PLE   estimates of 95th percentile and CLs
unlist(percentile.ple(beTWA))
#



