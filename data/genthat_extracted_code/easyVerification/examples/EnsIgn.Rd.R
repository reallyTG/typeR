library(easyVerification)


### Name: EnsIgn
### Title: Ignorance Score
### Aliases: EnsIgn EnsIgnss EnsIgnss

### ** Examples

tm <- toymodel()

## compute ignorance score for tercile forecasts
veriApply("EnsIgn", fcst=tm$fcst, obs=tm$obs, prob=1:2/3)

## compute skill score
veriApply("EnsIgnss", fcst=tm$fcst, obs=tm$obs, prob=1:2/3)




