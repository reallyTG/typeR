library(qmap)


### Name: fitQmapRQUANT
### Title: Non-parametric quantile mapping using robust empirical
###   quantiles.
### Aliases: fitQmapRQUANT fitQmapRQUANT.default fitQmapRQUANT.matrix
###   fitQmapRQUANT.data.frame doQmapRQUANT doQmapRQUANT.default
###   doQmapRQUANT.matrix doQmapRQUANT.data.frame

### ** Examples

data(obsprecip)
data(modprecip)

## single series example
qm.fit <- fitQmapRQUANT(obsprecip[,2],modprecip[,2],
                      qstep=0.1,nboot=10,wet.day=TRUE)
qm.a <- doQmapRQUANT(modprecip[,2],qm.fit,type="linear")
qm.b <- doQmapRQUANT(modprecip[,2],qm.fit,type="tricub")

sqrtquant <- function(x,qstep=0.01){
  qq <- quantile(x,prob=seq(0,1,by=qstep))
  sqrt(qq)
}

plot(sqrtquant(modprecip[,2]),
     sqrtquant(obsprecip[,2]))
lines(sqrtquant(modprecip[,2]),
      sqrtquant(qm.a),col="red")
lines(sqrtquant(modprecip[,2]),
      sqrtquant(qm.b),col="blue")
points(sqrt(qm.fit$par$modq),sqrt(qm.fit$par$fitq),
       pch=19,cex=1,col="green")
legend("topleft",
       legend=c("linear","tricub","support","data"),
       lty=c(1,1,NA,NA),pch=c(NA,NA,19,21),
       col=c("red","blue","green","black"))

qm2.fit <- fitQmapRQUANT(obsprecip,modprecip,
                       qstep=0.02,nboot=1,
                       wet.day=TRUE)
qm2 <- doQmapRQUANT(modprecip,qm2.fit,type="tricub")

op <- par(mfrow=c(1,3))
for(i in 1:3){
  plot(sqrtquant(modprecip[,i]),
       sqrtquant(obsprecip[,i]),
       main=names(qm2)[i])
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm2[,i]),col="red")
  points(sqrt(qm2.fit$par$modq[,i]),
         sqrt(qm2.fit$par$fitq[,i]),
       pch=19,cex=0.5,col="green")

}
par(op)




