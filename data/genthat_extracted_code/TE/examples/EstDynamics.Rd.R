library(TE)


### Name: EstDynamics
### Title: Estimate TE dynamics using mismatch data
### Aliases: EstDynamics EstDynamics2

### ** Examples

# Analyze Gypsy family 24 (Nusif)
data(AetLTR)
dat <- subset(AetLTR, GroupID == 24 & !is.na(Chr))
set.seed(1)
res1 <- EstDynamics(dat$Mismatch, dat$UngapedLen, plotFit=TRUE, plotSensitivity=FALSE, pause=FALSE)

# p-value for testing a uniform insertion rate
res1$pvalue


# Use a mixture distribution to improve fit
res2 <- EstDynamics2(dat$Mismatch, dat$UngapedLen, plotFit=TRUE)

# A larger number of trials is recommended to achieve the global MLE
## Not run: 
##D res3 <- EstDynamics2(dat$Mismatch, dat$UngapedLen, plotFit=TRUE, nTrial=1000L)
## End(Not run)



