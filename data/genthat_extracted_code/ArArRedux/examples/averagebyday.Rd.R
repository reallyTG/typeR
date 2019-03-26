library(ArArRedux)


### Name: averagebyday
### Title: Average all the data collected on the same day.
### Aliases: averagebyday

### ** Examples

dfile <- system.file("Calibration.csv",package="ArArRedux")
dlabels <- c("H1","AX","L1","L2")
md <- loaddata(dfile,dlabels,PH=TRUE)
ld <- fitlogratios(blankcorr(md))
d <- averagebyday(ld,"DCAL")
plotcorr(d)



