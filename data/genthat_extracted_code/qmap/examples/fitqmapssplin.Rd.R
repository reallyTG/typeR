library(qmap)


### Name: fitQmapSSPLIN
### Title: Quantile mapping using a smoothing spline
### Aliases: fitQmapSSPLIN fitQmapSSPLIN.default fitQmapSSPLIN.matrix
###   fitQmapSSPLIN.data.frame doQmapSSPLIN doQmapSSPLIN.default
###   doQmapSSPLIN.matrix doQmapSSPLIN.data.frame

### ** Examples

data(obsprecip)
data(modprecip)

qm.a.fit <- fitQmapSSPLIN(obsprecip[,2],modprecip[,2],
                      qstep=0.01,wet.day=TRUE)
qm.a <- doQmapSSPLIN(modprecip[,2],qm.a.fit)

## example on how to use spline.par
## (this example has little effect)
qm.b.fit <- fitQmapSSPLIN(obsprecip[,2],modprecip[,2],
                          qstep=0.01,wet.day=TRUE,
                          spline.par=list(cv=TRUE))
qm.b <- doQmapSSPLIN(modprecip[,2],qm.b.fit)

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
legend("topleft",legend=c("cv=FALSE","cv=TRUE"),
       lty=1,col=c("red","blue"))

qm2.fit <- fitQmapSSPLIN(obsprecip,modprecip,
                      qstep=0.1,wet.day=TRUE)
qm2 <- doQmapSSPLIN(modprecip,qm2.fit)


op <- par(mfrow=c(1,3))
for(i in 1:3){
  plot(sqrtquant(modprecip[,i]),
       sqrtquant(obsprecip[,i]),
       main=names(qm2)[i])
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm2[,i]),col="red")
}
par(op)




