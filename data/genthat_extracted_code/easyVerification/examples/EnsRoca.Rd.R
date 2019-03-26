library(easyVerification)


### Name: EnsRoca
### Title: Area Under the ROC Curve
### Aliases: EnsRoca oldEnsRoca EnsRocss EnsRocss

### ** Examples

tm <- toymodel()

## compute ROC area for tercile forecasts using veriApply
veriApply("EnsRoca", fcst=tm$fcst, obs=tm$obs, prob=1:2/3)




