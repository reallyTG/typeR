library(ChargeTransport)


### Name: Marcus
### Title: Marcus Charge Transfer Rates
### Aliases: Marcus
### Keywords: manip

### ** Examples

## Produce a map of the decimal logarithm of the Marcus,
## Marcus-Levich-Jortner and Landau-Zener rate expressions for:
nuN <- 1445 # effective vibrational mode wavenumber in cm-1
lambdaI <- 0.14  # internal reorganization energy in eV
lambdaS <- 36E-3 # external reorganization energy in eV

N  <- 301
J  <- seq( 0  , 65,length.out=N)*1E-3 # eV
dE <- seq(-0.5,0.5,length.out=N)      # eV
G  <- expand.grid(J, dE)
J  <- G[,1]
dE <- G[,2]

kMLJ    <- MarcusLevichJortner(
           J = J, lambdaI = lambdaI, lambdaS = lambdaS,
           hBarW = centimeterMinusOne2electronVolt(nuN), dE0 = dE)
kMarcus <- Marcus(
           J = J, lambda = lambdaI+lambdaS, dE0 = dE)
kLZ     <- LandauZener(
           J = J, lambda = lambdaI+lambdaS,
           nuN = centimeterMinusOne2Hertz(nuN), dE0 = dE)

kMLJ    <- matrix(kMLJ   , nrow = N, ncol = N)
kMarcus <- matrix(kMarcus, nrow = N, ncol = N)
kLZ     <- matrix(kLZ    , nrow = N, ncol = N)

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
contour(unique(J), unique(dE), log10(kMLJ   ),
        zlim = c(1,15), levels = -15:15, xaxt="n", yaxt="n", labcex=3)
addAxis(TRUE, TRUE, FALSE, FALSE)
title("Marcus-Levich-Jortner", line=1)
contour(unique(J), unique(dE), log10(kMarcus),
        zlim = c(1,15), levels = -15:15, xaxt="n", yaxt="n", labcex=3)
addAxis(TRUE, FALSE, FALSE, FALSE)
title("Marcus", line=1)
contour(unique(J), unique(dE), log10(kLZ    ),
        zlim = c(1,15), levels = -15:15, xaxt="n", yaxt="n", labcex=3)
addAxis(TRUE, FALSE, FALSE, TRUE)
title("Landau-Zener", line=1)



