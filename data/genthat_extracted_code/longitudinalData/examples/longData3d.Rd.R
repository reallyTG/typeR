library(longitudinalData)


### Name: longData3d
### Title: ~ Function: longData3d ~
### Aliases: longData3d longData3d,ANY,ANY,ANY,ANY,ANY,ANY-method
###   longData3d,missing,missing,missing,missing,missing,missing-method
### Keywords: package cluster methods

### ** Examples

#################
### From array

mat <- array(c(1,NA,3,2,3,6,1,8,10,1,NA,1,2,NA,3,2,3,2),dim=c(3,3,2))
longData3d(mat)
(ld1 <- longData3d(mat,varNames=c("Hyp","Col"),idAll=c("i101","i104","i105")))
plotTrajMeans3d(ld1)

#################
### From data.frame

dn <- data.frame(id=1:3,v1=c(2,2,1),t1=c(20,21,22),v1=c(3,2,2),t2=c(23,20,28),t3=c(25,24,29))
longData3d(dn,timeInData=list(c(2,4),c(3,5)),varNames=c("V","T"))
(ld3 <- longData3d(dn,timeInData=list(V=c(2,4,NA),T=c(3,5,6))))
plotTrajMeans3d(ld3)



