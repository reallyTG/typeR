library(easyVerification)


### Name: EnsSprErr
### Title: Spread to Error Ratio
### Aliases: EnsSprErr

### ** Examples

tm <- toymodel()
EnsSprErr(tm$fcst, tm$obs)

## compute spread to error ratio using veriApply
veriApply('EnsSprErr', fcst=tm$fcst, obs=tm$obs)




