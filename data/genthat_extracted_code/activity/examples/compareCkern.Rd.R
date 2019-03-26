library(activity)


### Name: compareCkern
### Title: Compare circular distributions.
### Aliases: compareCkern

### ** Examples

#Example with bootstrap reps limited to reduce run time
data(BCItime)
tPaca <- 2*pi*BCItime$time[BCItime$species=="paca"]
tRat <- 2*pi*BCItime$time[BCItime$species=="rat"]
fPaca <- fitact(tPaca)
fRat <- fitact(tRat)
compareCkern(fPaca,fRat,reps=10)



