library(regrrr)


### Name: compare_models
### Title: Compare regression models, which is compatible with the
###   reg.table output # updated 9/13/2018 #
### Aliases: compare_models

### ** Examples

data(mtcars)
m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
m2 <- update(m1, . ~ .+ wt * vs)
compare_models(m1, m2)




