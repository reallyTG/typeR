library(hoa)


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



