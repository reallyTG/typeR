library(LW1949)


### Name: fitLWauto
### Title: Best Fit Using Litchfield and Wilcoxon Evaluation of Dose-Effect
###   Experiments
### Aliases: fitLWauto

### ** Examples

dose <- c(0.0625, 0.125, 0.25, 0.5, 1)
ntested <- rep(8, 5)
nalive <- c(1, 4, 4, 7, 8)
mydat <- dataprep(dose=dose, ntot=ntested, nfx=nalive)
mydat
fitLWauto(mydat)



