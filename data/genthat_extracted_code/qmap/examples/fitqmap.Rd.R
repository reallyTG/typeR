library(qmap)


### Name: fitQmap
### Title: Quantile mapping
### Aliases: fitQmap doQmap

### ** Examples

data(obsprecip)
data(modprecip)

## call to fitQmapPTF and doQmapPTF
qm1.fit <- fitQmap(obsprecip,modprecip,
              method="PTF",
              transfun="expasympt",
              cost="RSS",wett.day=TRUE)
qm1 <- doQmap(modprecip,qm1.fit)

## call to fitQmapDIST and doQmapDIST
qm2.fit <- fitQmap(sqrt(obsprecip),sqrt(modprecip),
              method="DIST",qstep=0.001,
              transfun="berngamma")
qm2 <- doQmap(sqrt(modprecip),qm2.fit)^2

## call to fitQmapRQUANT and doQmapRQUANT
qm3.fit <- fitQmap(obsprecip,modprecip,
              method="RQUANT",qstep=0.01)
qm3 <- doQmap(modprecip,qm3.fit,type="linear")


## call to fitQmapRQUANT and doQmapRQUANT
qm4.fit <- fitQmap(obsprecip,modprecip,
              method="QUANT",qstep=0.01)
qm4 <- doQmap(modprecip,qm4.fit,type="tricub")

## call to fitQmapSSPLIN and doQmapSSPLIN
qm5.fit <- fitQmap(obsprecip,modprecip,qstep=0.01,
                   method="SSPLIN")
qm5 <- doQmap(modprecip,qm5.fit)

sqrtquant <- function(x,qstep=0.001){
  qq <- quantile(x,prob=seq(0,1,by=qstep))
  sqrt(qq)
}

op <- par(mfrow=c(1,3))
for(i in 1:3){
  plot(sqrtquant(modprecip[,i]),
       sqrtquant(obsprecip[,i]),pch=19,col="gray",
       main=names(obsprecip)[i])
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm1[,i]),col=1)
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm2[,i]),col=2)
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm3[,i]),col=3)
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm4[,i]),col=4)
  lines(sqrtquant(modprecip[,i]),
        sqrtquant(qm5[,i]),col=5)
}
legend("topleft",
       legend=c("PTF","DIST","RQUANT","QUANT","SSPLIN"),
       lty=1, col=1:5)
par(op)



