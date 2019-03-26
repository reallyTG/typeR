library(splancs)


### Name: kernel3d
### Title: Space-time kernel
### Aliases: kernel3d
### Keywords: spatial

### ** Examples

data(burkitt)
b3d <- kernel3d(burpts, burkitt$t, seq(250,350,10), seq(250, 400, 10),
  seq(365,5800,365), 30, 200)
brks <- quantile(b3d$v, seq(0,1,0.05))
cols <- heat.colors(length(brks)-1)
oldpar <- par(mfrow=c(3,5))
for (i in 1:15) image(seq(250,350,10), seq(250, 400, 10), b3d$v[,,i],
  asp=1, xlab="", ylab="", main=1960+i, breaks=brks, col=cols)
par(oldpar)



