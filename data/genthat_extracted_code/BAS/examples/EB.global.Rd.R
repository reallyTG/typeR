library(BAS)


### Name: EB.global
### Title: Find the global Empirical Bayes estimates for BMA
### Aliases: EB.global EB.global.bas
### Keywords: regression

### ** Examples


library(MASS)
data(UScrime)
UScrime[,-2] = log(UScrime[,-2])
# EB local uses a different g within each model
crime.EBL =  bas.lm(y ~ ., data=UScrime, n.models=2^15,
                    prior="EB-local", initprobs= "eplogp")
# use a common (global) estimate of g
crime.EBG = EB.global(crime.EBL)





