library(StMoMo)


### Name: apc
### Title: Create an Age-Period-Cohort mortality model
### Aliases: apc

### ** Examples


APC <- apc()
wxt <- genWeightMat(EWMaleData$ages,  EWMaleData$years, clip = 3)
APCfit <- fit(APC, data = EWMaleData, wxt = wxt)
plot(APCfit, parametricbx = FALSE, nCol = 3)




