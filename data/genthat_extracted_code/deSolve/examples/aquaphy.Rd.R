library(deSolve)


### Name: aquaphy
### Title: A Physiological Model of Unbalanced Algal Growth
### Aliases: aquaphy
### Keywords: models

### ** Examples

## ======================================================
##
## Example 1. PAR an on-off function
##
## ======================================================


## -----------------------------
## the model parameters:
## -----------------------------

parameters <- c(maxPhotoSynt   = 0.125,      # mol C/mol C/hr
                rMortPHY       = 0.001,      # /hr
                alpha          = -0.125/150, # uEinst/m2/s/hr
                pExudation     = 0.0,        # -
                maxProteinSynt = 0.136,      # mol C/mol C/hr
                ksDIN          = 1.0,        # mmol N/m3
                minpLMW        = 0.05,       # mol C/mol C
                maxpLMW        = 0.15,       # mol C/mol C
                minQuotum      = 0.075,      # mol C/mol C
                maxStorage     = 0.23,       # /h
                respirationRate= 0.0001,     # /h
                pResp          = 0.4,        # -
                catabolismRate = 0.06,       # /h
                dilutionRate   = 0.01,       # /h
                rNCProtein     = 0.2,        # mol N/mol C
                inputDIN       = 10.0,       # mmol N/m3
                rChlN          = 1,          # g Chl/mol N
                parMean        = 250.,       # umol Phot/m2/s
                dayLength      = 15.         # hours
                )

## -----------------------------
## The initial conditions
## -----------------------------

state <- c(DIN    = 6.,     # mmol N/m3
          PROTEIN = 20.0,   # mmol C/m3
          RESERVE = 5.0,    # mmol C/m3
          LMW     = 1.0)    # mmol C/m3

## -----------------------------
## Running the model
## -----------------------------

times <- seq(0, 24*20, 1)

out <- as.data.frame(aquaphy(times, state, parameters))

## -----------------------------
## Plotting model output
## -----------------------------

par(mfrow = c(2, 2), oma = c(0, 0, 3, 0))
col <- grey(0.9)
ii <- 1:length(out$PAR)              

plot(times[ii], out$Chlorophyll[ii], type = "l",
      main = "Chlorophyll", xlab = "time, hours",ylab = "ug/l")
polygon(times[ii], out$PAR[ii]-10, col = col, border = NA); box()
lines(times[ii], out$Chlorophyll[ii], lwd = 2 )


plot (times[ii], out$DIN[ii], type = "l", main = "DIN",
      xlab = "time, hours",ylab = "mmolN/m3")
polygon(times[ii], out$PAR[ii]-10, col = col, border = NA); box()
lines(times[ii], out$DIN[ii], lwd = 2 )


plot (times[ii], out$NCratio[ii], type = "n", main = "NCratio",
      xlab = "time, hours", ylab = "molN/molC")
polygon(times[ii], out$PAR[ii]-10, col = col, border = NA); box()
lines(times[ii], out$NCratio[ii], lwd = 2 )


plot (times[ii], out$PhotoSynthesis[ii],type = "l",
       main = "PhotoSynthesis", xlab = "time, hours",
       ylab = "mmolC/m3/hr")
polygon(times[ii], out$PAR[ii]-10, col = col, border = NA); box()
lines(times[ii], out$PhotoSynthesis[ii], lwd = 2 )

mtext(outer = TRUE, side = 3, "AQUAPHY, PAR= on-off", cex = 1.5)

## -----------------------------
## Summary model output
## -----------------------------
t(summary(out))

## ======================================================
##
## Example 2. PAR a forcing function data set
##
## ======================================================

times <- seq(0, 24*20, 1)

## -----------------------------
## create the forcing functions
## -----------------------------

ftime  <- seq(0,500,by=0.5)
parval <- pmax(0,250 + 350*sin(ftime*2*pi/24)+
   (runif(length(ftime))-0.5)*250)
Par    <- matrix(nc=2,c(ftime,parval))


state <- c(DIN     = 6.,     # mmol N/m3
           PROTEIN = 20.0,   # mmol C/m3
           RESERVE = 5.0,    # mmol C/m3
           LMW     = 1.0)    # mmol C/m3
              
out <- aquaphy(times, state, parameters, Par)

plot(out, which = c("PAR", "Chlorophyll", "DIN", "NCratio"), 
     xlab = "time, hours", 
     ylab = c("uEinst/m2/s", "ug/l", "mmolN/m3", "molN/molC"))

mtext(outer = TRUE, side = 3, "AQUAPHY, PAR=forcing", cex = 1.5)

# Now all variables plotted in one figure...
plot(out, which = 1:9, type = "l")

par(mfrow = c(1, 1))




