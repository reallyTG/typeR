library(EpiEstim)


### Name: DiscrSI
### Title: Discretized Generation Time Distribution Assuming A Shifted
###   Gamma Distribution
### Aliases: DiscrSI
### Keywords: distribution

### ** Examples

## Computing the discrete serial interval of influenza
MeanFluSI <- 2.6
SdFluSI <- 1.5
DicreteSIDistr <- vector()
for(i in 0:20)
{
    DicreteSIDistr[i+1] <- DiscrSI(i, MeanFluSI, SdFluSI)
}
plot(0:20, DicreteSIDistr, type="h", lwd=10, lend=1, xlab="time (days)", ylab="frequency")
title(main="Discrete distribution of the serial interval of influenza")



