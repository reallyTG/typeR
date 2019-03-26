library(ChargeTransport)


### Name: KMC
### Title: Charge Transport Simulation
### Aliases: KMC
### Keywords: manip

### ** Examples

########################################################################
## Electron transport within a periodic 1D-stack of 4 molecules:
##
##                        ... 4 | 1 2 3 4 | 1 ...
##
########################################################################
################ Preparation of the percolation network ################
nMols <- 4
## The charge can hop toward the right neigbour
con <- matrix(c(1:nMols,2:nMols,1), ncol=2)
## or the left neigbour
con <- rbind(con,con[,2:1])
## The number of pathways forming the percolation network is then:
nPaths <- 2*nMols
path.names <- paste0("P",1:nPaths)
dimnames(con) <- list(path.names, c("mol.i","mol.f"))
print(con)
########################################################################

############# Preparation of some data for the simulation ##############
## Lets consider a slight deformation of the stack along the z-axis over
## 11 frames of a molecular dynamics
nFrames <- 11
frame.names <- paste0("F", 1:nFrames)
dx <- matrix(0, ncol=nPaths, nrow=nFrames,
             dimnames=list(frame.names, path.names))
dy <- dx
# dz when hoping to the right
dz <- matrix(seq(3.0,4.0,length.out=nMols), ncol=nMols, nrow=nFrames)
# and when hoping to the left
dz <- cbind(dz, -dz)
dimnames(dz) <- dimnames(dx)
## The electronic couplings will slightly decrease
J  <- matrix(seq(10, 110, length.out=nFrames),
             ncol=nMols, nrow=nFrames)*1E-3
J  <- cbind( J, J)
dimnames(J) <- dimnames(dx)
## By symmetry all the sites have the same energy
dE <- 0
## We apply an electric field along the stack (z-axis)
Fn <- 1E5
F <- c(0,0,Fn)
## Lets consider the case of electron transport
carr <- "e"
## This introduce an addition term in the site energy differences.
dEFz <- dEField(dx,dy,dz,carr,F[1],F[2],F[3])
## Lets assum that:
lambda <- 0.14 # eV
########################################################################

############### Calculation of the charge transfer rates ###############
## Using the Marcus expression:
k <- Marcus(J,lambda,dE,dEFz)
format(k, digits=2, scientific=TRUE)
########################################################################

################### Execution of the KMC simulation ####################
cl <- makeCluster(2, outfile="") # Slave nodes output on master stdout
simuFz <- KMC(cl=cl, con=con, rates=k, dx=dx, dy=dy, dz=dz,
              type="BKL", nSimu=2, nHops=1E5)
########################################################################

###### More simulations applying the electric field along x or y #######
F <- c(Fn,0,0)
dEFx <- dEField(dx,dy,dz,carr,F[1],F[2],F[3])
k <- Marcus(J,lambda,dE,dEFx)
simuFx <- KMC(cl=cl, con=con, rates=k, dx=dx, dy=dy, dz=dz,
              type="BKL", nSimu=2, nHops=1E5)
F <- c(0,Fn,0)
dEFy <- dEField(dx,dy,dz,carr,F[1],F[2],F[3])
k <- Marcus(J,lambda,dE,dEFy)
simuFy <- KMC(cl=cl, con=con, rates=k, dx=dx, dy=dy, dz=dz,
              type="BKL", nSimu=2, nHops=1E5)              
########################################################################

################# Calculation of the mobility tensor ###################
driftVelocity <- function(simu){
  V <- c(
         x=1E-8*mean(simu$distx/simu$time),
         y=1E-8*mean(simu$disty/simu$time),
         z=1E-8*mean(simu$distz/simu$time))
  return(V) # Return the average drift velocity in cm.s-1
}
mu.Fx <- -driftVelocity(simuFx)/Fn # The minus is for electron transport
mu.Fy <- -driftVelocity(simuFy)/Fn # The minus is for electron transport
mu.Fz <- -driftVelocity(simuFz)/Fn # The minus is for electron transport
mu <- cbind(mu.Fx, mu.Fy, mu.Fz)
eigen(mu)
########################################################################



