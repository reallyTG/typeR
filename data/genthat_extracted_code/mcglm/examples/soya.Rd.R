library(mcglm)


### Name: soya
### Title: Soybeans
### Aliases: soya
### Keywords: datasets

### ** Examples

library(mcglm)
library(Matrix)
data(soya, package="mcglm")
formu <- grain ~ block + factor(water) * factor(pot)
Z0 <- mc_id(soya)
fit <- mcglm(linear_pred = c(formu), matrix_pred = list(Z0),
          data = soya)
          anova(fit)



