library(longitudinalData)


### Name: LongData-class
### Title: ~ Class: LongData ~
### Aliases: LongData LongData-class [,LongData-method
###   [,LongData-ANY,ANY,ANY [<-,LongData-method [<-,LongData-ANY,ANY,ANY
###   LongData_show show,LongData-method is.na,LongData-method
### Keywords: classes classif cluster ts

### ** Examples

#################
### building trajectory (longData)
mat <- matrix(c(NA,2,3,4,1,6,2,5,1,3,8,10),4)
ld <- longData(mat,idAll=c("I1","I2","I3","I4"),time=c(2,4,8),varNames="Age")

### '[' and '[<-'
ld["idAll"]
ld["idFewNA"]
ld["varNames"]
ld["traj"]
(ld)

### Plot
plotTrajMeans(ld,parMean=parMEAN(type="n"))



