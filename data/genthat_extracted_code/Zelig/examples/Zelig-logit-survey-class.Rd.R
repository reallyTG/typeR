library(Zelig)


### Name: Zelig-logit-survey-class
### Title: Logit Regression with Survey Weights
### Aliases: Zelig-logit-survey-class zlogitsurvey

### ** Examples


data(api, package = "survey")
apistrat$yr.rnd.numeric <- as.numeric(apistrat$yr.rnd == "Yes")
z.out1 <- zelig(yr.rnd.numeric ~ meals + mobility, model = "logit.survey",
               weights = apistrat$pw, data = apistrat)

summary(z.out1)
x.low <- setx(z.out1, meals= quantile(apistrat$meals, 0.2))
x.high <- setx(z.out1, meals= quantile(apistrat$meals, 0.8))
s.out1 <- sim(z.out1, x = x.low, x1 = x.high)
summary(s.out1)
plot(s.out1)




