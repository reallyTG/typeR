library(asbio)


### Name: trim.ranef.test
### Title: Robust test for random factors using trimmed means.
### Aliases: trim.ranef.test
### Keywords: htest univar

### ** Examples

rye<-c(50,49.8,52.3,44.5,62.3,74.8,72.5,80.2,47.6,39.5,47.7,50.7)
nutrient<-factor(c(rep(1,4),rep(2,4),rep(3,4)))
trim.ranef.test(rye,nutrient,tr=.2)



