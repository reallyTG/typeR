library(LW1949)


### Name: predLinesLP
### Title: Add Litchfield and Wilcoxon Predictions to a Plot
### Aliases: predLinesLP

### ** Examples

dose <- c(0.0625, 0.125, 0.25, 0.5, 1)
ntested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=dose, ntot=ntested, nfx=nalive)
plotDELP(mydat)
myfit <- LWestimate(fitLWauto(mydat), mydat)
predLinesLP(myfit)



