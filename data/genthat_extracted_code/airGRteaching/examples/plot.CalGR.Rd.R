library(airGRteaching)


### Name: plot.CalGR
### Title: Time series plotting of GR calibration objects
### Aliases: plot.CalGR

### ** Examples

library(airGR)

## data.frame of observed data
data(L0123001)
BasinObs2 <- BasinObs[, c("DatesR", "P", "E", "Qmm", "T")]

## Preparation of observed data for modelling
PREP <- PrepGR(ObsDF = BasinObs2, HydroModel = "GR5J", CemaNeige = TRUE)

## Calibration step
CAL <- CalGR(PrepGR = PREP, CalCrit = "KGE2",
             WupPer = NULL, CalPer = c("1990-01-01", "1993-12-31"))
plot(CAL, which = "perf")
plot(CAL, which = "ts")
plot(CAL, which = "iter")



