library(s20x)


### Name: ciReg
### Title: Confidence Intervals for Regression models
### Aliases: ciReg
### Keywords: htest

### ** Examples


##Peruvian Indians data
data(peru.df)
fit=lm(BP ~ age + years + weight + height, data = peru.df)
ciReg(fit)




