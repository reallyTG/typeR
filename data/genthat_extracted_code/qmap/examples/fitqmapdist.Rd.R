library(qmap)


### Name: fitQmapDIST
### Title: Quantile mapping using distribution derived transformations
### Aliases: fitQmapDIST fitQmapDIST.default fitQmapDIST.matrix
###   fitQmapDIST.data.frame doQmapDIST doQmapDIST.default
###   doQmapDIST.matrix doQmapDIST.data.frame

### ** Examples

data(obsprecip)
data(modprecip)

qm.fit <- fitQmapDIST(obsprecip[,1],modprecip[,1],
                      distr="berngamma",
                      qstep=0.001)
qm <- doQmapDIST(modprecip[,1],qm.fit)


qm.lnorm.fit <- fitQmapDIST(obsprecip[,1],modprecip[,1],
                      distr="bernlnorm",
                      qstep=0.001)
qm.lnorm <- doQmapDIST(modprecip[,1],qm.lnorm.fit)


qm.weibu.fit <- fitQmapDIST(obsprecip[,1],modprecip[,1],
                      distr="bernweibull",
                      qstep=0.001)
qm.weibu <- doQmapDIST(modprecip[,1],qm.weibu.fit)

qm.exp.fit <- fitQmapDIST(sqrt(obsprecip[,1]),sqrt(modprecip[,1]),
                      distr="bernexp",
                      qstep=0.001)
qm.exp <- doQmapDIST(sqrt(modprecip[,1]),qm.exp.fit)^2


## utility function. 
## plots are easier to investigate if
## precipitation data are sqrt transformed
sqrtquant <- function(x,qstep=0.01){
  qq <- quantile(x,prob=seq(0,1,by=qstep))
  sqrt(qq)
}

plot(sqrtquant(modprecip[,1]),
     sqrtquant(obsprecip[,1]))
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm),col="red")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm.lnorm),col="blue")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm.weibu),col="green")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm.exp),col="orange")
legend("topleft",
       legend=c("berngamma","bernlnorm","bernweibull","bernexp"),
       lty=1,
       col=c("red","blue","green","orange"))

## effect of qstep on speed of fitting process:
system.time(
qm.a.fit <- fitQmapDIST(obsprecip[,2],modprecip[,2],
                       distr="berngamma",
                       start.fun=startberngamma,
                       qstep=0.001)
)

system.time(
qm.b.fit <- fitQmapDIST(obsprecip[,2],modprecip[,2],
                       distr="berngamma",
                       start.fun=startberngamma,
                       qstep=0.01)
)

qm.a <- doQmapDIST(modprecip[,2],qm.a.fit)
qm.b <- doQmapDIST(modprecip[,2],qm.b.fit)

plot(sqrtquant(modprecip[,2]),
     sqrtquant(obsprecip[,2]))
lines(sqrtquant(modprecip[,2]),
     sqrtquant(qm.a),col="red")
lines(sqrtquant(modprecip[,2]),
     sqrtquant(qm.b),col="blue")
legend("topleft",
       legend=c("qstep=0.001","qstep=0.01"),
       col=c("red","blue"),
       lty=1)


## method for matrix
## the sqrt() transformation renders the
## fitting procedure more stable
qm2.fit <- fitQmapDIST(sqrt(obsprecip),sqrt(modprecip),
                       distr="berngamma",
                       qstep=0.001)
qm2 <- doQmapDIST(sqrt(modprecip),qm2.fit)^2

if(!any(is.na(qm2.fit$par))){
  op <- par(mfrow=c(1,3))
  for(i in 1:3){
    plot(sqrtquant(modprecip[,i]),
         sqrtquant(obsprecip[,i]))
    lines(sqrtquant(modprecip[,i]),
          sqrtquant(qm2[,i]),col="red")
  }
 par(op)
}



