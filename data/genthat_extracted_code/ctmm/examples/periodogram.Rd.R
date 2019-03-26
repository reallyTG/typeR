library(ctmm)


### Name: periodogram
### Title: Calculate the Lomb-Scargle periodogram of animal-tracking data
### Aliases: periodogram plot.periodogram

### ** Examples

#Load package and data
library(ctmm)
data(wolf)

#Extract movement data for a single animal
Tay <- wolf$Tay

#Calculate periodogram (fast==2 for a speedy example)
#There is some variability in the sampling frequency, so we increase res.time
LSP <- periodogram(Tay,fast=2,res.time=2)

#Plot the periodogram
plot(LSP,max=TRUE)



