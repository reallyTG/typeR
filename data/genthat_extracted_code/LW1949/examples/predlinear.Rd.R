library(LW1949)


### Name: predlinear
### Title: Determine the Effective Dose from a Linear Regression Fit
### Aliases: predlinear

### ** Examples


predlinear(c(16, 50, 84, 99.9), c(1.700875, 2.199559), simple=TRUE)

dose <- c(0.0625, 0.125, 0.25, 0.5, 1)
ntested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=dose, ntot=ntested, nfx=nalive)
fLW <- LWestimate(fitLWauto(mydat), mydat)
predlinear(c(25, 50, 99.9), fLW)



