library(FME)


### Name: sensRange
### Title: Sensitivity Ranges of a Timeseries or 1-D Variables
### Aliases: sensRange summary.sensRange plot.sensRange
###   plot.summary.sensRange
### Keywords: utilities

### ** Examples


## =======================================================================
## Bacterial growth model from Soetaert and Herman, 2009
## =======================================================================

pars <- list(gmax = 0.5,eff = 0.5,
              ks = 0.5, rB = 0.01, dB = 0.01)

solveBact <- function(pars) {
  derivs <- function(t,state,pars) {    # returns rate of change
    with (as.list(c(state,pars)), {
      dBact <- gmax*eff * Sub/(Sub + ks)*Bact - dB*Bact - rB*Bact
      dSub  <- -gmax    * Sub/(Sub + ks)*Bact + dB*Bact
      return(list(c(dBact,dSub)))
    })
  }

  state <- c(Bact = 0.1,Sub = 100)
  tout  <- seq(0, 50, by = 0.5)
  ## ode solves the model by integration ...
  return(as.data.frame(ode(y = state, times = tout, func = derivs,
    parms = pars)))
}

out <- solveBact(pars)

mf  <-par(mfrow = c(2,2))

plot(out$time, out$Bact, main = "Bacteria",
     xlab = "time, hour", ylab = "molC/m3", type = "l", lwd = 2)

## the sensitivity parameters
parRanges <- data.frame(min = c(0.4, 0.4, 0.0), max = c(0.6, 0.6, 0.02))
rownames(parRanges)<- c("gmax", "eff", "rB")
parRanges

tout <- 0:50
## sensitivity to rB; equally-spaced parameters ("grid")
SensR <- sensRange(func = solveBact, parms = pars, dist = "grid",
                   sensvar = "Bact", parRange = parRanges[3,], num = 50)

Sens  <-summary(SensR)
plot(Sens, legpos = "topleft", xlab = "time, hour", ylab = "molC/m3",
     main = "Sensitivity to rB", mfrow = NULL)

## sensitivity to all; latin hypercube
Sens2 <- summary(sensRange(func = solveBact, parms = pars, dist = "latin",
           sensvar = c("Bact", "Sub"), parRange = parRanges, num = 50))

## Plot all variables; plot mean +- sd, min max
plot(Sens2, xlab = "time, hour", ylab = "molC/m3",
     main = "Sensitivity to gmax,eff,rB", mfrow = NULL)

par(mfrow = mf)

## Select one variable for plotting; plot the quantiles
plot(Sens2, xlab = "time, hour", ylab = "molC/m3", which = "Bact", quant = TRUE)

## Add data
data <- cbind(time = c(0,10,20,30), Bact = c(0,1,10,45))
plot(Sens2, xlab = "time, hour", ylab = "molC/m3", quant = TRUE, 
  obs = data, obspar = list(col = "darkblue", pch = 16, cex = 2))






