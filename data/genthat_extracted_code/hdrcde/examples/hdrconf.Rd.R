library(hdrcde)


### Name: hdrconf
### Title: HDRs with confidence intervals
### Aliases: hdrconf
### Keywords: distribution smooth

### ** Examples


x <- c(rnorm(100,0,1),rnorm(100,4,1))
den <- density(x,bw=hdrbw(x,50))
trueden <- den
trueden$y <- 0.5*(exp(-0.5*(den$x*den$x)) + exp(-0.5*(den$x-4)^2))/sqrt(2*pi)
sortx <- sort(x)

par(mfcol=c(2,2))
for(conf in c(50,95))
{
    m <- hdrconf(sortx,trueden,conf=conf)
    plot(m,trueden,main=paste(conf,"% HDR from true density"))
    m <- hdrconf(sortx,den,conf=conf)
    plot(m,den,main=paste(conf,"% HDR from empirical density\n(n=200)"))
}




