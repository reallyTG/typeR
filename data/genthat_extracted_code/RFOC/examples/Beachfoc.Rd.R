library(RFOC)


### Name: Beachfoc
### Title: Plot a BeachBall Focal Mechanism
### Aliases: Beachfoc
### Keywords: hplot aplot

### ** Examples


MEC = SDRfoc(65,25,13, u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=TRUE)

Beachfoc(MEC, fcol=MEC$fcol, fcolback="white")




