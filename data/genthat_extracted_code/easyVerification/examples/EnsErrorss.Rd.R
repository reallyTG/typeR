library(easyVerification)


### Name: EnsErrorss
### Title: Ensemble Mean Error Skill scores
### Aliases: EnsErrorss EnsMaess EnsMsess EnsRmsess

### ** Examples

tm <- toymodel()

## compute RMSE skill score against reference forecast with a bias of +2
EnsErrorss(ens=tm$fcst, ens.ref=tm$fcst + 2, obs=tm$obs, type='rmse')

## compute skill score using veriApply
veriApply("EnsRmsess", fcst=tm$fcst, obs=tm$obs, fcst.ref=tm$fcst + 2)





