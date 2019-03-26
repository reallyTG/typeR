library(LW1949)


### Name: assessfit
### Title: Assess Fit of Dose-Response Curve
### Aliases: assessfit

### ** Examples

conc <- c(0.0625, 0.125, 0.25, 0.5, 1)
numtested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=conc, ntot=numtested, nfx=nalive)
gamfit <- gamtable1()
assessfit(log10(c(0.125, 0.5)), mydat, simple=FALSE)



