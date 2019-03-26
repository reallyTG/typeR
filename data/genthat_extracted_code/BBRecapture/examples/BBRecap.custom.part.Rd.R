library(BBRecapture)


### Name: BBRecap.custom.part
### Title: Bayesian inference for behavioural effect models based on a
###   partition of the set of all partial capture histories
### Aliases: BBRecap.custom.part
### Keywords: Behavioural models Bayesian inference

### ** Examples

data(greatcopper)
partition.Mc1=partition.ch(quant.binary,t=ncol(greatcopper),breaks=c(0,0.5,1))
mod.Mc1=BBRecap.custom.part(greatcopper,partition=partition.Mc1)
str(mod.Mc1)



