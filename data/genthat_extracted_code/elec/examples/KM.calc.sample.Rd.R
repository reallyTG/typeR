library(elec)


### Name: KM.calc.sample
### Title: Calculate sample size for KM-audit.
### Aliases: KM.calc.sample print.audit.plan.KM

### ** Examples

  data(santa.cruz)
  Z = elec.data( santa.cruz, C.names=c("danner","leopold") )
  KM.calc.sample( Z, beta=0.75, taint=0 )



