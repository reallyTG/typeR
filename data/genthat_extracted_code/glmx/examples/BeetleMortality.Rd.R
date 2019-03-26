library(glmx)


### Name: BeetleMortality
### Title: Bliss (1935) Beetle Mortality Data
### Aliases: BeetleMortality
### Keywords: datasets

### ** Examples

## data
data("BeetleMortality", package = "glmx")

## various standard binary response models
m <- lapply(c("logit", "probit", "cloglog"), function(type)
  glm(cbind(died, n - died) ~ dose, data = BeetleMortality, family = binomial(link = type)))

## visualization
plot(I(died/n) ~ dose, data = BeetleMortality)
lines(fitted(m[[1]]) ~ dose, data = BeetleMortality, col = 2)
lines(fitted(m[[2]]) ~ dose, data = BeetleMortality, col = 3)
lines(fitted(m[[3]]) ~ dose, data = BeetleMortality, col = 4)



