library(quantable)


### Name: runrobscale
### Title: running robust scaling of arefw
### Aliases: runrobscale

### ** Examples

res = c(rnorm(1000,0,1),rnorm(2000,4,3))
res2 = runrobscale(res)
par(mfrow=c(2,1))
plot(res,type="p",pch="x",col=1,cex=0.3)
lines(res2$runmed,col=3)

y = runFun( res2$scaled, k=51, func=mad )
#hist(y)
y2 = runFun(res2$scaled,k=51,func=median)
plot(res2$scaled,pch="*")
lines(y2,col=2,lwd=3)
lines(y2+y,col=3,lwd=3)
lines(y2-y,col=3,lwd=3)




