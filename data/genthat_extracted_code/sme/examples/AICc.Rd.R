library(sme)


### Name: AICc
### Title: The corrected AIC
### Aliases: AICc

### ** Examples

  data(MTB)
  fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")])
  AICc(fit)



