library(rlme)


### Name: rlme-package
### Title: rlme
### Aliases: rlme-package
### Keywords: models package

### ** Examples



library(rlme)
data(schools)
formula = y ~ 1 + sex + age + (1 | region) + (1 | region:school)
rlme.fit = rlme(formula, schools)
summary(rlme.fit)




