library(ica)


### Name: icasamp
### Title: Sample from Various Source Signal Distributions
### Aliases: icasamp

### ** Examples

##########   EXAMPLE   ##########

# sample 1000 observations from distribution "f"
set.seed(123)
mysamp <- icasamp("f","rnd",nsamp=1000)
xr <- range(mysamp)
hist(mysamp,freq=FALSE,ylim=c(0,.8),breaks=sqrt(1000))

# evaluate density of distribution "f"
xseq <- seq(-5,5,length.out=1000)
mypdf <- icasamp("f","pdf",data=xseq)
lines(xseq,mypdf)

# evaluate kurtosis of distribution "f"
icasamp("f","kur")




