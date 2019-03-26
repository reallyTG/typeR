library(ChargeTransport)


### Name: activationFreeEnergy
### Title: Activation Free Energy
### Aliases: activationFreeEnergy
### Keywords: manip

### ** Examples

## Produce a map of the non-adiabatic free energy barrier and
## two other maps of the non-adiabatic free energy barrier corrected by
## the deviation between the adiabatic and non-adiabatic potential energy curves at:
##   - the crossing point (dEad = dEna - abs(J))
##   - both the crossing point and the minimas of the curves (dEad = dEna - Delta)
## We assume that the reorganization energies are the following:
lambdaI <- 0.14  # internal reorganization energy in eV
lambdaS <- 36E-3 # external reorganization energy in eV
lambda <- lambdaI + lambdaS

N  <- 301
J  <- seq( 0  , 65,length.out=N)*1E-3 # eV
dE <- seq(-0.5,0.5,length.out=N)      # eV
G  <- expand.grid(J, dE)
J  <- G[,1]
dE <- G[,2]

dEna      <- activationFreeEnergy(lambda = lambda, dE0 = dE, dEField = 0)
dEad      <- dEna - adiabaticCorrection(J = J, lambda = lambda, dE0 = dE, dEField = 0)
dEadCross <- dEna -  J

dEna      <- matrix(dEna     , nrow = N, ncol = N)
dEad      <- matrix(dEad     , nrow = N, ncol = N)
dEadCross <- matrix(dEadCross, nrow = N, ncol = N)

addAxis <- function(bottom = TRUE, left = FALSE, above = FALSE, right = FALSE){
  useless <- lapply(1:4,axis, labels=FALSE)
  if(bottom) axis(1, labels = TRUE)
  if(left  ) axis(2, labels = TRUE)
  if(above ) axis(3, labels = TRUE)
  if(right ) axis(4, labels = TRUE)
  if(bottom) mtext(side=1,line=1.2, text=expression( abs(J)/eV), cex=par("cex"))
  if(left  ) mtext(side=2,line=1.2, text=expression(Delta*E/eV), cex=par("cex"))
  if(right ) mtext(side=4,line=1.2, text=expression(Delta*E/eV), cex=par("cex"))
  box()
}

layout(matrix(1:3, ncol=3))
par(cex=2, lwd=1.5, pty="s", mgp=c(1.1,0.1,0), tck=0.02, mar=rep(0.7,4), oma=rep(2,4))
contour(unique(J), unique(dE), dEna     , levels = seq(-0.1,0.6,0.1),
        xaxt="n", yaxt="n", labcex=2)
addAxis(TRUE, TRUE, FALSE, FALSE)
title(expression(Delta*E[na]), line=1)
contour(unique(J), unique(dE), dEadCross, levels = seq(-0.1,0.6,0.1),
        xaxt="n", yaxt="n", labcex=2)
addAxis(TRUE, FALSE, FALSE, FALSE)
title(expression(Delta*E[na]-J), line=1)
contour(unique(J), unique(dE), dEad     , levels = seq(-0.1,0.6,0.1),
        xaxt="n", yaxt="n", labcex=2)
addAxis(TRUE, FALSE, FALSE, TRUE)
title(expression(Delta*E[na]-Delta), line=1)



