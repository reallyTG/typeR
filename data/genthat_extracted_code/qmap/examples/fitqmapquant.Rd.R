library(qmap)


### Name: fitQmapQUANT
### Title: Non-parametric quantile mapping using empirical quantiles.
### Aliases: fitQmapQUANT fitQmapQUANT.default fitQmapQUANT.matrix
###   fitQmapQUANT.data.frame doQmapQUANT doQmapQUANT.default
###   doQmapQUANT.matrix doQmapQUANT.data.frame

### ** Examples

data(obsprecip)
data(modprecip)

qm.fit <- fitQmapQUANT(obsprecip[,2],modprecip[,2],
                      qstep=0.1,nboot=1,wet.day=TRUE)
qm.a <- doQmapQUANT(modprecip[,2],qm.fit,type="linear")
qm.s <- doQmapQUANT(modprecip[,2],qm.fit,type="tricub")


sqrtquant <- function(x,qstep=0.01){
  qq <- quantile(x,prob=seq(0,1,by=qstep))
  sqrt(qq)
}

plot(sqrtquant(modprecip[,2]),
     sqrtquant(obsprecip[,2]))
lines(sqrtquant(modprecip[,2]),
      sqrtquant(qm.a),col="red")
lines(sqrtquant(modprecip[,2]),
      sqrtquant(qm.s),col="blue")
points(sqrt(qm.fit$par$modq),sqrt(qm.fit$par$fitq),
       pch=19,cex=0.5,col="green")
legend("topleft",
       legend=c("linear","tricub","support"),
       lty=c(1,1,NA),pch=c(NA,NA,19),
       col=c("red","blue","green"))
         

qm2.fit <- fitQmapQUANT(obsprecip,modprecip,
                      qstep=0.01,nboot=1,wet.day=TRUE)
qm2 <- doQmapQUANT(modprecip,qm2.fit,type="tricub")

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





