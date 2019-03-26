library(TE)


### Name: nbLackOfFitKL
### Title: Calcualte the KL divergence of a negative binomial fit to the
###   mismatch data.
### Aliases: nbLackOfFitKL

### ** Examples

# Analyze Gypsy family 24 (Nusif)
data(AetLTR)
dat <- subset(AetLTR, GroupID == 24 & !is.na(Chr))
set.seed(1)
res1 <- EstDynamics(dat$Mismatch, dat$UngapedLen, plotFit=TRUE, plotSensitivity=FALSE, pause=FALSE)
nbLackOfFitKL(res1)



