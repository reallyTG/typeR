library(MSnbase)


### Name: bin-methods
### Title: Bin 'MSnExp' or 'Spectrum' instances
### Aliases: bin-methods bin
### Keywords: methods

### ** Examples

s <- new("Spectrum2", mz=1:10, intensity=1:10)
intensity(s)
intensity(bin(s, binSize=2))

data(itraqdata)
sum(peaksCount(itraqdata))
itraqdata2 <- bin(itraqdata, binSize=2)
sum(peaksCount(itraqdata2))
processingData(itraqdata2)



