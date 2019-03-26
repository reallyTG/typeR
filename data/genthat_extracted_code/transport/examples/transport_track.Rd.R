library(transport)


### Name: transport_track
### Title: Create a Dynamic Visualization of a Transference Plan Between
###   Two pgrids
### Aliases: transport_track

### ** Examples

tplan <- transport(random32a,random32b)
series <- transport_track(random32a, random32b, tplan, scmult=3, create.file="none")
dev.new(width=16,height=8)
oldpar <- par(mfrow=c(5,10), mai=rep(0.01,4))
for (i in 1:50) { 
  image(series[,,i], col=grey(seq(0,1,0.005)), asp=1, axes=FALSE,zlim=c(min(series),max(series)))
}
par(oldpar)



