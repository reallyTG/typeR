library(nlme)


### Name: ergoStool
### Title: Ergometrics experiment with stool types
### Aliases: ergoStool
### Keywords: datasets

### ** Examples

fm1 <-
   lme(effort ~ Type, data = ergoStool, random = ~ 1 | Subject)
anova( fm1 )



