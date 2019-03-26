library(ecolMod)


### Name: OMEXDIAsteady
### Title: steady-state application of the OMEXDIA diagenetic model -
###   fortran DLL
### Aliases: OMEXDIAsteady
### Keywords: misc

### ** Examples
N      <- 100
Depth  <- seq(0.05, by = 0.1, len = 100)
out    <- OMEXDIAsteady()

# Steady-state concentrations in sediment
CONC  <- out$steady

FDET  <- CONC[1:N]
SDET  <- CONC[(N+1)  :(2*N)]
O2    <- CONC[(2*N+1):(3*N)]
NO3   <- CONC[(3*N+1):(4*N)]
NH3   <- CONC[(4*N+1):(5*N)]
ODU   <- CONC[(5*N+1):(6*N)]

TOC  <- (FDET+SDET)*1200/10^9/2.5     # % organic carbon (excess)

par(mfrow=c(2, 2))
plot(TOC, Depth, ylim = c(10, 0), xlab = "procent", main = "TOC",
        type = "l", lwd=2)
plot(O2, Depth, ylim = c(10, 0), xlab = "mmol/m3", main = "O2",
        type = "l", lwd = 2)
plot(NO3, Depth, ylim = c(10, 0), xlab = "mmol/m3", main = "NO3",
        type = "l", lwd = 2)
plot(NH3, Depth, ylim = c(10, 0), xlab = "mmol/m3", main = "NH3",
        type = "l", lwd = 2)


mtext(outer=TRUE,side=3,line=-2,cex=1.5,"OMEXDIAmodel")


