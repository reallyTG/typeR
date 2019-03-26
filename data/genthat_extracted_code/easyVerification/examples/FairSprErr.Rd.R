library(easyVerification)


### Name: FairSprErr
### Title: Fair Spread to Error Ratio
### Aliases: FairSprErr

### ** Examples

tm <- toymodel()
FairSprErr(tm$fcst, tm$obs)

## compute spread to error ratio using veriApply
veriApply('FairSprErr', fcst=tm$fcst, obs=tm$obs)

## compare with 'unfair' spread to error ratio
veriApply("EnsSprErr", fcst=tm$fcst, obs=tm$obs)




