library(sme)


### Name: BICn
### Title: An alternative BIC for longitudinal models
### Aliases: BICn

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  BICn(fit)



