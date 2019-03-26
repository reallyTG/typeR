library(ArArRedux)


### Name: loaddata
### Title: Load mass spectrometer data
### Aliases: loaddata

### ** Examples

samplefile <- system.file("Samples.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
m <- loaddata(samplefile,masses) # samples and J-standards
plot(m,"MD2-1a","Ar40")



