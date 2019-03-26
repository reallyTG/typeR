library(LW1949)


### Name: estimable
### Title: Determine if a Dose-Effect Relation is Estimable
### Aliases: estimable

### ** Examples

conc <- c(0.0625, 0.125, 0.25, 0.5, 1)
numtested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=conc, ntot=numtested, nfx=nalive)
estimable(mydat)
nalive2 <- rep(4, 5)
mydat2 <- dataprep(dose=conc, ntot=numtested, nfx=nalive2)
estimable(mydat2)



