library(easyVerification)


### Name: climFairRpss
### Title: Calculate Fair Ranked Probability Skill Score Against
###   Climatological Reference Forecast.
### Aliases: climFairRpss

### ** Examples

tm <- toymodel()

## compute RPSS using veriApply
veriApply("climFairRpss", tm$fcst, tm$obs, prob=1:2/3)




