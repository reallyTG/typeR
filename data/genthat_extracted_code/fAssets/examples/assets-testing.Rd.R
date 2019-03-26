library(fAssets)


### Name: assets-testing
### Title: Testing Normality of Multivariate Asset Sets
### Aliases: assetsTest mvshapiroTest mvenergyTest
### Keywords: models

### ** Examples

## LPP -
   # Load Swiss Pension Fund Data:
   LPP <- LPP2005REC[, 1:6]
   head(LPP)
   
## assetsTest -
   # Multivariate Shapiro Test - 
   assetsTest(LPP, "shapiro")
  
## assetsTest -
   # Multivariate Energy Test - 
   assetsTest(LPP, "energy")



