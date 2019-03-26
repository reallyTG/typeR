library(spagmix)


### Name: rstpoint
### Title: Generate random points in space-time
### Aliases: rstpoint

### ** Examples

## No test: 
r1a <- sgmix(cbind(c(0.5,0.5)),vcv=0.01,window=toywin,p0=0.5,p=c(0.5),res=128)
r1b <- sgmix(cbind(c(0.5,0.5),c(0.4,0.6)),vcv=c(0.06,0.015),window=toywin,
             p0=0.1,p=c(0.5,0.4),res=128)
r1c <- sgmix(cbind(c(0.4,0.6)),vcv=c(0.1),window=toywin,p0=0.1,p=c(0.9),res=128)
sts1 <- stkey(start=r1a,
              stop=r1c,
              tlim=c(1,10),
              tres=64,
              window=toywin,
              kf=solist(r1a,r1b),
              kftimes=c(2,6),
              fscale=0.1+0.9*dnorm(seq(-3,3,length=64),mean=0,sd=1))
plot(sts1,sleep=0.1)

Y <- rstpoint(500,sts1,W=toywin,correction=10,maxpass=500)
plot(Y)

require("rgl")
plot3d(Y$x,Y$y,marks(Y))
## End(No test)



