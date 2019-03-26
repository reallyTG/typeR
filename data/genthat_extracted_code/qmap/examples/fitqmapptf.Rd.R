library(qmap)


### Name: fitQmapPTF
### Title: Quantile mapping using parametric transformations
### Aliases: fitQmapPTF fitQmapPTF.default fitQmapPTF.matrix
###   fitQmapPTF.data.frame doQmapPTF doQmapPTF.default doQmapPTF.matrix
###   doQmapPTF.data.frame

### ** Examples

data(obsprecip)
data(modprecip)

## data.frame example
qm.fit <- fitQmapPTF(obsprecip,modprecip,
                     transfun="power.x0",
                     cost="RSS",wet.day=TRUE,
                     qstep=0.001)
qm <- doQmapPTF(modprecip,qm.fit)

## application to "single time series"
qm.b.fit <- fitQmapPTF(obsprecip[,1],modprecip[,1],
                     transfun="expasympt.x0",
                     cost="RSS",wet.day=0.1,
                     qstep=0.001)
qm.b <- doQmapPTF(modprecip[,1],qm.b.fit)
qm.c.fit <- fitQmapPTF(obsprecip[,1],modprecip[,1],
                     transfun="expasympt",
                     cost="RSS",wet.day=TRUE,
                     qstep=0.001)
qm.c <- doQmapPTF(modprecip[,1],qm.c.fit)

## user defined transfer function
## and usage of the 'opar' argument
## (same as transfun="power")
myff <- function(x,a,b) a*x^b

qm3.fit <- fitQmapPTF(obsprecip[,1],modprecip[,1],
                     transfun=myff,
                     opar=list(par=c(a=1,b=1)),
                     cost="RSS",wet.day=TRUE,
                     qstep=0.001)
qm3 <- doQmapPTF(modprecip[,1],qm3.fit)


sqrtquant <- function(x,qstep=0.01){
  qq <- quantile(x,prob=seq(0,1,by=qstep))
  sqrt(qq)
}
plot(sqrtquant(modprecip[,1]),
     sqrtquant(obsprecip[,1]))
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm[,1]),col="red")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm.b),col="blue")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm.c),col="green")
lines(sqrtquant(modprecip[,1]),
      sqrtquant(qm3),col="orange")
legend("topleft",
       legend=c("power.x0","expasympt.x0",
         "expasympt","myff"),
       col=c("red","blue","green","orange"),lty=1)





