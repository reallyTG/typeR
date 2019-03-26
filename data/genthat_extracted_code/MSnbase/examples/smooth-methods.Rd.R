library(MSnbase)


### Name: smooth-methods
### Title: Smooths 'MSnExp' or 'Spectrum' instances
### Aliases: smooth-methods smooth
### Keywords: methods

### ** Examples

sp1 <- new("Spectrum1",
           intensity = c(1:6, 5:1),
           mz = 1:11)
sp2 <- smooth(sp1, method = "MovingAverage", halfWindowSize = 2)
intensity(sp2)

data(itraqdata)
itraqdata2 <- smooth(itraqdata, 
                     method = "MovingAverage", 
                     halfWindowSize = 2)
processingData(itraqdata2)



