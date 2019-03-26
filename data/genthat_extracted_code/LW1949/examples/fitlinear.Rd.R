library(LW1949)


### Name: fitlinear
### Title: Determine Linear Regression Coefficients from Dose-Effect Data
### Aliases: fitlinear

### ** Examples

conc <- c(0.0625, 0.125, 0.25, 0.5, 1)
numtested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=conc, ntot=numtested, nfx=nalive)
fitlinear(mydat)



