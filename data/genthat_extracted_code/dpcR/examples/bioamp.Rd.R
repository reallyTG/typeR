library(dpcR)


### Name: bioamp
### Title: A function to analyze plot the raw data from a Bio-Rad droplet
###   digital PCR experiment
### Aliases: bioamp
### Keywords: Amplitude Bio-Rad

### ** Examples


par(mfrow = c(1,2))
bioamp(data = pds_raw[["D01"]], main = "Well D01", pch = 19)
bioamp(data = pds_raw[["D02"]], main = "Well D02", pch = 19)
par(mfrow = c(1,1))




