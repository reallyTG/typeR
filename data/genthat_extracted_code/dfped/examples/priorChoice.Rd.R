library(dfped)


### Name: priorChoice
### Title: Decision function for the choice of variance (sigmaHI or
###   sigmaLI) in the adaptive prior variance calibration.
### Aliases: priorChoice

### ** Examples

tox <-  c(0.10, 0.21, 0.33, 0.55, 0.76)
givenDose <- 2

skeleton_tox1 <- c(0.10, 0.21, 0.33, 0.55, 0.76)
skeleton_tox2 <- c(0.21, 0.33, 0.55, 0.76, 0.88)
skeleton_tox3 <- c(0.05, 0.10, 0.21, 0.33, 0.55)
skeleton_tox4 <- c(0.025, 0.05,0.1, 0.21, 0.33)
skeleton_tox5 <- c(0.0125, 0.025, 0.05,0.1, 0.21)

skeletonTox <-  data.frame(skeleton_tox1, skeleton_tox2, skeleton_tox3, 
                           skeleton_tox4, skeleton_tox5)

lesb <- c(0.10, 0.16, 0.23, 0.25, 0.30)
priorChoice(tox, givenDose, skeletonTox, lesb)



