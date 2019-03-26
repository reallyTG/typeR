library(SEAsic)


### Name: pc
### Title: Plot a Single or Multiple Conditional Indices
### Aliases: pc

### ** Examples

#Obtaining and plotting the unstandardized RSD(x) for all five subpopulations 
#in the example data set, ex.data
rsd_g1 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],d=.5)
rsd_g2 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],d=.5)
rsd_g3 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],d=.5)
rsd_g4 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],d=.5)
rsd_g5 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5)

pc(con=c(rsd_g1,rsd_g2,rsd_g3,rsd_g4,rsd_g5),n=5,d=.5,
connames=c("RSD Group 1","RSD Group 2","RSD Group 3","RSD Group 4","RSD Group 5"),
ylim=c(0,4),yleg=4)

#Obtaining and plotting the standardized RSD(x) for all five subpopulations 
#in the example data set, ex.data
srsd_g1 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,3],d=.5,s=4.2)
srsd_g2 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,4],d=.5,s=4.2)
srsd_g3 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,5],d=.5,s=4.2)
srsd_g4 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,6],d=.5,s=4.2)
srsd_g5 <- rsd(x=ex.data[,1],o=ex.data[,2],g=ex.data[,7],d=.5,s=4.2)

pc(con=c(srsd_g1,srsd_g2,srsd_g3,srsd_g4,srsd_g5),n=5,d=.5,
connames=c("RSD Group 1","RSD Group 2","RSD Group 3","RSD Group 4","RSD Group 5"),
s=4.2,ylim=c(0,2),yleg=2,ylab="Standardized Equating Dependence")

#Obtaining and plotting the unstandardized RMSD(x) for all five subpopulations 
#in the example data set, ex.data
rmsd <- rmsd(x=ex.data[,1],o=ex.data[,2],
g=c(ex.data[,3],ex.data[,4],ex.data[,5],ex.data[,6],ex.data[,7]),w=c(.1,.2,.4,.2,.1),d=.5)

pc(con=c(rmsd),n=1,d=.5,connames=c("RMSD"),
ylim=c(0,4),yleg=4,ylab="Root Mean Square Differences")



