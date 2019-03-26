library(longitudinalData)


### Name: longData
### Title: ~ Function: longData ~
### Aliases: longData longData,ANY,ANY,ANY,ANY,ANY,ANY-method
###   longData,missing,missing,missing,missing,missing,missing-method
### Keywords: package cluster methods

### ** Examples

#####################
### From matrix

### Small data
mat <- matrix(c(1,NA,3,2,3,6,1,8,10),3,3,dimnames=list(c(101,102,104),c("T2","T4","T8")))
longData(mat)
(ld1 <- longData(traj=mat,idAll=as.character(c(101,102,104)),time=c(2,4,8),varNames="V"))
plotTrajMeans(ld1)

### Big data
mat <- matrix(runif(1051*325),1051,325)
(ld2 <- longData(traj=mat,idAll=paste("I-",1:1051,sep=""),time=(1:325)+0.5,varNames="Random"))

####################
### From data.frame

dn <- data.frame(id=1:3,v1=c(NA,2,1),v2=c(NA,1,0),v3=c(3,2,2),v4=c(4,2,NA))

### Basic
longData(dn)

### Selecting some times
(ld3 <- longData(dn,timeInData=c(1,2,4),varNames=c("Hyp")))

### Excluding trajectories with more than 1 NA
(ld3 <- longData(dn,maxNA=1))



