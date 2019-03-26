library(airGRteaching)


### Name: dyplot
### Title: Interactive time series plotting of GR data
### Aliases: dyplot.default dyplot dyplot.PrepGR dyplot.CalGR dyplot.SimGR

### ** Examples

library(airGR)

## data.frame of observed data
data(L0123001)
BasinObs2 <- BasinObs[, c("DatesR", "P", "E", "Qmm", "T")]

## Preparation of observed data for modelling
PREP <- PrepGR(ObsDF = BasinObs2, HydroModel = "GR4J", CemaNeige = FALSE)
## No test: 
dyplot(PREP, main = "Observation")
## End(No test)

## Calibration step
CAL <- CalGR(PrepGR = PREP, CalCrit = "KGE2",
             WupPer = NULL, CalPer = c("1990-01-01", "1993-12-31"))
## No test: 
dyplot(CAL, main = "Calibration")
## End(No test)

## Simulation
SIM <- SimGR(PrepGR = PREP, CalGR = CAL, EffCrit = "KGE2",
             WupPer = NULL, SimPer = c("1994-01-01", "1998-12-31"))
## No test: 
dyplot(SIM, main = "Simulation")
## End(No test)



