library(COUNT)


### Name: titanic
### Title: titanic
### Aliases: titanic
### Keywords: datasets

### ** Examples


data(titanic)
titanic$survival <- titanic$survived == "yes"
glmlr <- glm(survival ~ age + sex + factor(class), family=binomial, data=titanic)
summary(glmlr)




