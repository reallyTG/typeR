library(wmtsa)


### Name: wavFDPSDF
### Title: Spectral density function for a fractionally differenced process
### Aliases: wavFDPSDF
### Keywords: models

### ** Examples

## create a normalized frequency vector 
f <- seq(from=1e-2, to=1/2, length=100)

## calculate the FDP SDF for delta=0.45 and unit 
## innovations variance 
S <- wavFDPSDF(f, delta=0.45, variance=1)

## plot the results 
plot(f, S,log="xy", xlab="Frequency", ylab="SDF of FDP(0.45, 1)")



