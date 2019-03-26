library(heavy)


### Name: heavyLme
### Title: Linear mixed-effects models under heavy-tailed distributions
### Aliases: heavyLme heavyLme.formula
### Keywords: models

### ** Examples

data(dental)
fit <- heavyLme(distance ~ age * Sex, random = ~ age, groups = ~ Subject, 
  data = dental, family = Student(df = 4))
summary(fit)



