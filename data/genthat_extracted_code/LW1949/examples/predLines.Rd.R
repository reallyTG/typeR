library(LW1949)


### Name: predLines
### Title: Add Litchfield and Wilcoxon Predictions to a Plot
### Aliases: predLines

### ** Examples

dose <- c(0.0625, 0.125, 0.25, 0.5, 1)
ntested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=dose, ntot=ntested, nfx=nalive)
plotDE(mydat)
myfit <- LWestimate(fitLWauto(mydat), mydat)
predLines(myfit)



