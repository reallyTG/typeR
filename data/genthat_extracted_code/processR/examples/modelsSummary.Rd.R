library(processR)


### Name: modelsSummary
### Title: Make Summary for Model Coefficients
### Aliases: modelsSummary

### ** Examples

fit1=lm(mpg~wt,data=mtcars)
fit2=lm(mpg~wt*hp,data=mtcars)
labels=list(Y="mpg",X="wt",W="hp",Z="am")
modelsSummary(list(fit1,fit2),labels=labels)



