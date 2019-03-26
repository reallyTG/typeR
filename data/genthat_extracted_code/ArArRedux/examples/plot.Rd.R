library(ArArRedux)


### Name: plot.timeresolved
### Title: Plot a time resolved mass spectrometry signal
### Aliases: plot.timeresolved plot.PHdata

### ** Examples

samplefile <- system.file("Samples.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
mMC <- loaddata(samplefile,masses)
plot(mMC,"MD2-1a","Ar40")
mPH <- loaddata(samplefile,masses,PH=TRUE)
plot(mPH,"MD2-1a","Ar40")



