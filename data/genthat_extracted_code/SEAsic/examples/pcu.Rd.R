library(SEAsic)


### Name: pcu
### Title: Plot Multiple Conditional/Unconditional Indices
### Aliases: pcu

### ** Examples

#Obtaining and plotting the unstandardized RSD(x) and RESD for all five subpopulations 
#in the example data set, ex.data
rsd_g1 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],d=.5)
rsd_g2 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],d=.5)
rsd_g3 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],d=.5)
rsd_g4 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],d=.5)
rsd_g5 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5)
resd_g1 <- resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],f=ex.data[,8])
resd_g2 <- resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],f=ex.data[,8])
resd_g3 <- resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],f=ex.data[,8])
resd_g4 <- resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],f=ex.data[,8])
resd_g5 <- resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],f=ex.data[,8])

pcu(con=c(rsd_g1,rsd_g2,rsd_g3,rsd_g4,rsd_g5),
u=c(resd_g1,resd_g2,resd_g3,resd_g4,resd_g5),d=.5,
connames=c("RSD Group 1","RSD Group 2","RSD Group 3","RSD Group 4","RSD Group 5"),
unames=c("RESD Group 1","RESD Group 2","RESD Group 3","RESD Group 4","RESD Group 5"),
ylim=c(0,8),yleg=8)

#Obtaining and plotting the standardized RSD(x) and RESD for all five subpopulations 
#in the example data set, ex.data
srsd_g1 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],d=.5,s=4.2)
srsd_g2 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],d=.5,s=4.2)
srsd_g3 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],d=.5,s=4.2)
srsd_g4 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],d=.5,s=4.2)
srsd_g5 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5,s=4.2)
sresd_g1<-resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],f=ex.data[,8],s=4.2)
sresd_g2<-resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],f=ex.data[,8],s=4.2)
sresd_g3<-resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],f=ex.data[,8],s=4.2)
sresd_g4<-resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],f=ex.data[,8],s=4.2)
sresd_g5<-resd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],f=ex.data[,8],s=4.2)

pcu(con=c(srsd_g1,srsd_g2,srsd_g3,srsd_g4,srsd_g5),
u=c(sresd_g1,sresd_g2,sresd_g3,sresd_g4,sresd_g5),d=.5,s=4.2,
connames=c("RSD Group 1","RSD Group 2","RSD Group 3","RSD Group 4","RSD Group 5"),
unames=c("RESD Group 1","RESD Group 2","RESD Group 3","RESD Group 4","RESD Group 5"),
ylim=c(0,2),yleg=2,ylab="Standardized Equating Dependence")

#Obtaining and plotting the unstandardized RMSD(x) and REMSD for all five subpopulations 
#in the example data set, ex.data
rmsd <- rmsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
w=c(.1,.2,.4,.2,.1),d=.5)
remsd <- remsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),
f=ex.data[,8],w=c(.1,.2,.4,.2,.1))

pcu(con=c(rmsd),u=c(remsd),d=.5,connames=c("RMSD"),unames=c("REMSD"),ylim=c(0,4),yleg=4)



