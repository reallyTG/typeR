library(ArArRedux)


### Name: read
### Title: Read mass spectrometer data
### Aliases: read

### ** Examples

samplefile <-  system.file("Samples.csv",package="ArArRedux")
kfile <- system.file("K-glass.csv",package="ArArRedux")
cafile <- system.file("Ca-salt.csv",package="ArArRedux")
dfile <- system.file("Calibration.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
dlabels <- c("H1","AX","L1","L2")
X <- read(samplefile,masses,blabel="EXB#",Jpos=c(3,15),
          kfile,cafile,dfile,dlabels)
plotcorr(X)



