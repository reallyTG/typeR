library(LW1949)


### Name: dataprep
### Title: Prepare Data
### Aliases: dataprep

### ** Examples

conc <- c(0.0625, 0.125, 0.25, 0.5, 1)
numtested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
dataprep(dose=conc, ntot=numtested, nfx=nalive)



