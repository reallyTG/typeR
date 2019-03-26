library(msme)


### Name: titanic
### Title: Titanic passenger survival data
### Aliases: titanic
### Keywords: datasets

### ** Examples

data(titanic)

glm.lr <- glm(survived ~ age + sex + factor(class),
             family=binomial, data=titanic)
summary(glm.lr)
exp(coef(glm.lr))

glm.irls <- irls(survived ~ age + sex + factor(class),
                 family = "binomial",
                 link = "cloglog",
                 data = titanic)
summary(glm.irls)
exp(coef(glm.irls))

glm.ml <- ml_glm(survived ~ age + sex + factor(class),
                 family = "bernoulli",
                 link = "cloglog1",
                 data = titanic)
summary(glm.ml)
exp(coef(glm.ml))




