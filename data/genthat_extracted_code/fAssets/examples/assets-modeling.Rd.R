library(fAssets)


### Name: assets-modeling
### Title: Modeling Multivariate Asset Sets
### Aliases: assetsFit assetsSim
### Keywords: models

### ** Examples

## LPP2005REC -
   # Load Swiss Pension Fund Data as Percentual Returns:
   LPP <- 100 * LPP2005REC[, 1:3]
   head(LPP)
   
## assetsFit -
   # Fit a Skew-Student-t Distribution: 
   fit <- assetsFit(LPP)
   # Extract the Model:
   model <- fit@fit$dp
   # Show Model Slot:
   print(model)
   
## assetsSim -
   # Simulate set with same statistical properties:
   set.seed(1953)
   LPP.SIM <- assetsSim(n=nrow(LPP), model=model)
   colnames(LPP.SIM) <- colnames(LPP)
   head(LPP.SIM) 



