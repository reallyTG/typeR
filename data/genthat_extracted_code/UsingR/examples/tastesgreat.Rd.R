library(UsingR)


### Name: tastesgreat
### Title: Does new goo taste great?
### Aliases: tastesgreat
### Keywords: datasets

### ** Examples

data(tastesgreat)
summary(glm(enjoyed ~ gender + age, data=tastesgreat, family=binomial))



