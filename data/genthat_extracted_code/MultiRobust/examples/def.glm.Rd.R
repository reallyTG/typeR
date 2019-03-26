library(MultiRobust)


### Name: def.glm
### Title: Define a Generalized Linear Model
### Aliases: def.glm

### ** Examples

# A logistic regression with response R and covariates X1 and X2
mis1 <- def.glm(formula = R ~ X1 + X2, family = binomial(link = logit))



