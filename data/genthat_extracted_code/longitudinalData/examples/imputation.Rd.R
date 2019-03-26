library(longitudinalData)


### Name: imputation
### Title: ~ Function: imputation ~
### Aliases: imputation imputation,matrix-method imputation,array-method
###   imputation,LongData-method imputation,LongData3d-method
### Keywords: package cluster ts NA methods

### ** Examples

##################
### Preparation of the data
par(ask=TRUE)
timeV <- 1:14

matMissing <- matrix(
    c(NA  ,NA  ,NA  ,18  ,22  ,NA  ,NA  ,NA  ,NA  , 24  , 22  , NA  , NA  , NA,
      24  ,21  ,24  ,26  ,27  ,32  ,30  ,22  ,26  , 26  , 28  , 24  , 23  , 21,
      14  ,13  , 10 , 8  , 7  ,18  ,16  , 8  ,12  ,  6  ,  10 ,  10 ,  9  ,  7,
       3  ,1   , 1  , 1  ,  3,9   , 7  , -1 , 3   ,  2   ,  4 ,  1  ,  0  , -2
   ),4,byrow=TRUE
)


matplot(t(matMissing),col=c(2,1,1,1),lty=1,type="l",lwd=c(3,1,1,1),pch=16,
   xlab="Black=trajectories; Green=mean trajectory\nRed=trajectory to impute",
   ylab="",main="Four trajectories")
moy <- apply(matMissing,2,mean,na.rm=TRUE)
lines(moy,col=3,lwd=3)

 # # # # # # # # # # # # # # # # # # # # # # # # # #
#   Illustration of the different imputing method   #
 #           The best are at end  !!!              #
  # # # # # # # # # # # # # # # # # # # # # # # # #



##################
### Methods using cross sectionnal information (cross-methods)

par(mfrow=c(1,3))
mat2 <- matrix(c(
  NA, 9, 8, 8, 7, 6,NA,
   7, 6,NA,NA,NA, 4,5,
   3, 4, 3,NA,NA, 2,3,
  NA,NA, 1,NA,NA, 1,1),4,7,byrow=TRUE)

### crossMean
matplot(t(imputation(mat2,"crossMean")),type="l",ylim=c(0,10),
   lty=1,col=1,main="crossMean")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)

### crossMedian
matplot(t(imputation(mat2,"crossMedian")),type="l",ylim=c(0,10),
   lty=1,col=1,main="crossMedian")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)

### crossHotDeck
matplot(t(imputation(mat2,"crossHotDeck")),type="l",ylim=c(0,10),
   lty=1,col=1,main="crossHotDeck")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)



##################
### Methods using trajectory information (traj-methods)

par(mfrow=c(2,3))
mat1 <- matrix(c(NA,NA,3,8,NA,NA,2,2,1,NA,NA),1,11)

### locf
matplot(t(imputation(mat1,"locf")),type="l",ylim=c(0,10),
   main="locf\n DO NOT USE, BAD METHOD !!!")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)

### nocb
matplot(t(imputation(mat1,"nocb")),type="l",ylim=c(0,10),
   main="nocb\n DO NOT USE, BAD METHOD !!!")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)

### trajMean
matplot(t(imputation(mat1,"trajMean")),type="l",ylim=c(0,10),
   main="trajMean")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)

### trajMedian
matplot(t(imputation(mat1,"trajMedian")),type="l",ylim=c(0,10),
   main="trajMedian")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)

### trajHotDeck
matplot(t(imputation(mat1,"trajHotDeck")),type="l",ylim=c(0,10),
   main="trajHotDeck 1")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)

### spline
matplot(t(imputation(mat1,"spline",lowerBound=NA,upperBound=NA)),
   type="l",ylim=c(-10,10),main="spline")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16)





##################
### Different linear interpolation

par(mfrow=c(2,2))

### linearInterpol.locf
matplot(t(imputation(mat1,"linearInterpol.locf",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="linearInterpol.locf")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16,lty=1)

### linearInterpol.global
matplot(t(imputation(mat1,"linearInterpol.global",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="linearInterpol.global")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16,lty=1)

### linearInterpol.local
matplot(t(imputation(mat1,"linearInterpol.local",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="linearInterpol.local")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16,lty=1)

### linearInterpol.bisector
matplot(t(imputation(mat1,"linearInterpol.bisector",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="linearInterpol.bisector")
matlines(t(mat1),type="o",col=2,lwd=3,pch=16,lty=1)



##################
### Copy mean

mat3 <- matrix(c(
  NA, 9, 8, 8, 7, 6,NA,
   7, 6,NA,NA,NA, 4,5,
   3, 4, 3,NA,NA, 2,3,
  NA,NA, 1,NA,NA, 1,1),4,7,byrow=TRUE)


par(mfrow=c(2,2))

### copyMean.locf
matplot(t(imputation(mat2,"copyMean.locf",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="copyMean.locf")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)

### copyMean.global
matplot(t(imputation(mat2,"copyMean.global",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="copyMean.global")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)

### copyMean.local
matplot(t(imputation(mat2,"copyMean.local",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="copyMean.local")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)

### copyMean.bisector
matplot(t(imputation(mat2,"copyMean.bisector",NA,NA)),type="l",
   ylim=c(-5,10),lty=1,col=1,main="copyMean.bisector")
matlines(t(mat2),type="o",col=2,lwd=3,pch=16,lty=1)




### crossMean
matImp <- imputation(matMissing,method="crossMean")
matplot(t(matImp),col=c(2,1,1,1),lty=c(2,1,1,1),type="l",lwd=c(2,1,1,1),pch=16,
   xlab="Dotted red=imputed trajectory\nFull red=trajectory to impute",
   ylab="",main="Method 'crossMean'")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)


### crossMedian
matImp <- imputation(matMissing,method="crossMedian")
matplot(t(matImp),col=c(2,1,1,1),lty=c(2,1,1,1),type="l",lwd=c(2,1,1,1),pch=16,
   xlab="Dotted red=imputed trajectory\nFull red=trajectory to impute",ylab="",
   main="Method 'crossMedian'")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### crossHotDeck
matImp <- imputation(matMissing,method="crossHotDeck")
matplot(t(matImp),col=c(2,1,1,1),lty=c(2,1,1,1),type="l",lwd=c(2,1,1,1),pch=16,
   xlab="Dotted red=imputed trajectory\nFull red=trajectory to impute",ylab="",
   main="Method 'crossHotDeck'")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)


##################
### Method using trajectory

par(mfrow=c(2,3))
### trajMean
matImp <- imputation(matMissing,method="trajMean")
plot(timeV,matImp[1,],type="l",lwd=2,ylim=c(10,30),ylab="",xlab="nocb")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### trajMedian
matImp <- imputation(matMissing,method="trajMedian")
plot(timeV,matImp[1,],type="l",lwd=2,ylim=c(10,30),ylab="",xlab="nocb")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### trajHotDeck
matImp <- imputation(matMissing,method="trajHotDeck")
plot(timeV,matImp[1,],type="l",lwd=2,ylim=c(10,30),ylab="",xlab="nocb")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### locf
matImp <- imputation(matMissing,method="locf")
plot(timeV,matImp[1,],type="l",lwd=2,ylim=c(10,30),ylab="",xlab="locf")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### nocb
matImp <- imputation(matMissing,method="nocb")
plot(timeV,matImp[1,],type="l",lwd=2,ylim=c(10,30),ylab="",xlab="nocb")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

par(mfrow=c(2,2))

### linearInterpol.locf
matImp <- imputation(matMissing,method="linearInterpol.locf")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### linearInterpol.local
matImp <- imputation(matMissing,method="linearInterpol.local")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### linearInterpol.global
matImp <- imputation(matMissing,method="linearInterpol.global")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)

### linearInterpol.bisector
matImp <- imputation(matMissing,method="linearInterpol.bisector")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)


par(mfrow=c(2,2))

### copyMean.locf
matImp <- imputation(matMissing,method="copyMean.locf")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)
lines(timeV,moy,col=3,type="o",lwd=3)

### copyMean.local
matImp <- imputation(matMissing,method="copyMean.local")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)
lines(timeV,moy,col=3,type="o",lwd=3)

### copyMean.global
matImp <- imputation(matMissing,method="copyMean.global")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)
lines(timeV,moy,col=3,type="o",lwd=3)

### copyMean.bisector
matImp <- imputation(matMissing,method="copyMean.bisector")
plot(timeV,matImp[1,],type="o",ylim=c(0,30),ylab="",xlab="LI-Global")
lines(timeV,matMissing[1,],col=2,type="o",lwd=3)
lines(timeV,moy,col=3,type="o",lwd=3)

par(ask=FALSE)



