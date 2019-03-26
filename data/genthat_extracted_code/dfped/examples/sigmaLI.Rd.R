library(dfped)


### Name: sigmaLI
### Title: Compute the least informative prior variance for the adaptive
###   prior.
### Aliases: sigmaLI

### ** Examples

targetTox <- 0.25             # target of toxicity  

####### Skeleton ########### 

skeleton_tox1 <- c(0.10, 0.21, 0.33, 0.55, 0.76)
skeleton_tox2 <- c(0.21, 0.33, 0.55, 0.76, 0.88)
skeleton_tox3 <- c(0.05, 0.10, 0.21, 0.33, 0.55)
skeleton_tox4 <- c(0.025, 0.05, 0.1, 0.21, 0.33)
skeleton_tox5 <- c(0.0125, 0.025, 0.05, 0.1, 0.21)
skeletonTox <-  data.frame(skeleton_tox1, skeleton_tox2, skeleton_tox3, 
                    skeleton_tox4, skeleton_tox5)
mu <- -0.34 
sigmaLI <- sigmaLI(skeletonTox[ ,1], mu, a = NULL, "power_log", targetTox)



