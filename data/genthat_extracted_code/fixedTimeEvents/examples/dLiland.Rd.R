library(fixedTimeEvents)


### Name: dLiland
### Title: The distribution of distances between discrete events in fixed
###   time/space (the Liland distribution)
### Aliases: fixedTimeEvents dLiland pLiland qLiland rLiland

### ** Examples

dLiland(19, R = 1949, r = 162)
pLiland(19, R = 1949, r = 162)
qLiland(0.5, R = 1949, r = 162)
plot( pLiland(1:100, R = 1949, r = 162) )

## QQ-plot of Liland distribution and random Liland values
R <- 2000
r <- 120
n <- 1000
samp <- rLiland(n,R,r)
theo <- qLiland(ppoints(n),R,r)
qqplot(theo,samp,
       xlab='F(x;2000,120)', ylab='Sample (1000)', axes=FALSE)
axis(1,at=c(0,40,80,120))
axis(2,at=c(0,40,80,120))
box()
qqline(samp, distribution = function(p)qLiland(p,R=2000,r=120), col='gray',lty=2)



