library(overlap)


### Name: bootstrap functions
### Title: Functions to generate bootstrap estimates of overlap
### Aliases: bootEst resample

### ** Examples

data(simulatedData)
tigSim <- resample(tigerObs, 99)
dim(tigSim)

pigSim <- resample(pigObs, 99)
boots <- bootEst(tigSim, pigSim)
colMeans(boots)
# or just do Dhat4
boots <- bootEst(tigSim, pigSim, type="Dhat4")
mean(boots)
# parallel processing takes longer for this example
boots <- bootEst(tigSim, pigSim, type="Dhat4", cores=2)
mean(boots)




