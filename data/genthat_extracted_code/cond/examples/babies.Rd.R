library(cond)


### Name: babies
### Title: Crying Babies Data
### Aliases: babies
### Keywords: datasets

### ** Examples

data(babies)
coplot(r2/(r1+r2) ~ day | lull, data = babies)
##
babies.glm <- glm(formula = cbind(r1, r2) ~ day + lull - 1, 
                  family = binomial, data = babies)
babies.cond <- cond(object = babies.glm, offset = lullyes)
babies.cond
##
## If one wishes to avoid the generalized linear model fit:
babies.cond <- cond.glm(formula = cbind(r1, r2) ~ day + lull - 1, 
                        family = binomial, data = babies, offset = lullyes)
babies.cond



