library(StMoMo)


### Name: genWeightMat
### Title: Generate weight matrix
### Aliases: genWeightMat

### ** Examples

#Zero-weight the first three and last three cohorts
wxt1 <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
APCfit1 <- fit(apc(), data = EWMaleData, ages.fit = 55:89, 
               wxt = wxt1)
plot(APCfit1, parametricbx = FALSE, nCol = 3)

#Also Zero-weight the 1886 cohort
wxt2 <- genWeightMat(55:89,  EWMaleData$years, clip = 3, 
                     zeroCohorts = 1886)
APCfit2 <- fit(apc(), data = EWMaleData, ages.fit = 55:89, 
               wxt = wxt2)
plot(APCfit2, parametricbx = FALSE, nCol = 3)




