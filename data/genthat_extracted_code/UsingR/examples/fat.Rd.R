library(UsingR)


### Name: fat
### Title: Body measurements to predict percentage of body fat in males
### Aliases: fat
### Keywords: datasets

### ** Examples

data(fat)
f = body.fat ~ age + weight + height + BMI + neck + chest + abdomen +
hip + thigh + knee + ankle + bicep + forearm + wrist
res = lm(f, data=fat)
summary(res)



