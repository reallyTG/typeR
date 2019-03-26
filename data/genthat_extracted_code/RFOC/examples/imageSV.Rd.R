library(RFOC)


### Name: imageSV
### Title: P-wave radiation pattern
### Aliases: imageSV
### Keywords: hplot

### ** Examples


MEC =SDRfoc(65,25,13, u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=FALSE)
imageSV(MEC$az1, MEC$dip1, MEC$rake1, SCALE=TRUE, UP=MEC$UP, col=rainbow(100) )




