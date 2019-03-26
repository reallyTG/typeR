library(BBRecapture)


### Name: LBRecap.custom.part
### Title: Unconditional likelihood inference for behavioural effect models
###   based on an ad-hoc partition of the set of all partial capture
###   histories
### Aliases: LBRecap.custom.part
### Keywords: Behavioural models Unconditional MLE

### ** Examples

data(greatcopper)
partition.Mc1=partition.ch(quant.binary,t=ncol(greatcopper),breaks=c(0,0.5,1))
mod.Mc1=LBRecap.custom.part(greatcopper,partition=partition.Mc1)
str(mod.Mc1)



