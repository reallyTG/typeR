library(WiSEBoot)


### Name: retrieveBootstrapSample
### Title: Construct the bootstrap data series from wavelet coefficients
### Aliases: retrieveBootstrapSample
### Keywords: datagen smooth

### ** Examples

someData <- rnorm(2^5)

##Bootstrap sample of size 10 is not recommended. For demonstration only.
bootInfo <- WiSEBoot(someData, R=10, J0=2)
bootSeries <- retrieveBootstrapSample(bootInfo)$BootSample

bootSeries[1, , 1] #this is the first bootstrap series



