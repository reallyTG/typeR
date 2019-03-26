library(Zelig)


### Name: Zelig-probit-survey-class
### Title: Probit Regression with Survey Weights
### Aliases: Zelig-probit-survey-class zprobitsurvey

### ** Examples

data(api, package="survey")
z.out1 <- zelig(enroll ~ api99 + yr.rnd ,
model = "poisson.survey", data = apistrat)
summary(z.out1)
x.low <- setx(z.out1, api99= quantile(apistrat$api99, 0.2))
x.high <- setx(z.out1, api99= quantile(apistrat$api99, 0.8))
s.out1 <- sim(z.out1, x=x.low, x1=x.high)
summary(s.out1)
plot(s.out1)




