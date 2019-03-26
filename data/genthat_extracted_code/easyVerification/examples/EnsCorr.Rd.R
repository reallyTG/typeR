library(easyVerification)


### Name: EnsCorr
### Title: Correlation with Ensemble Mean
### Aliases: EnsCorr

### ** Examples

tm <- toymodel()

## compute correlation directly
EnsCorr(tm$fcst, tm$obs)

## compute correlation using veriApply
veriApply("EnsCorr", tm$fcst, tm$obs)




