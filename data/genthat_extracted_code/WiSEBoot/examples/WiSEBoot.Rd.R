library(WiSEBoot)


### Name: WiSEBoot
### Title: Wild Scale-Enhanced (WiSE) Bootstrap for Model Selection
### Aliases: WiSEBoot
### Keywords: nonparametric ts distribution models

### ** Examples

##R=10 bootstrap samples is not recommended.  For demonstration only.

##bootstrap one of the simulated series, threshold level 4 (not the truth)
data(SimulatedSNR15Series)
bootObj <- WiSEBoot(SimulatedSNR15Series[, 3], R=10, J0=4)

#boxplot of the bootstrap intercept and slope estimates (both 0 in truth)
par(mfrow=c(1,2))
boxplot(bootObj$BootIntercept); boxplot(bootObj$BootSlope)

#boxplot of the bootstrap wavelet coefficient estimates, level 1
par(mfrow=c(1,2))
boxplot(bootObj$BootWavelet[ , 3, 1]); boxplot(bootObj$BootWavelet[ , 4, 1])


##See what smooth level the bootstrap chooses (truth is J0=2)
bootObj2 <- WiSEBoot(SimulatedSNR15Series[ ,3], R=10)
bootObj2$MSECriteria



