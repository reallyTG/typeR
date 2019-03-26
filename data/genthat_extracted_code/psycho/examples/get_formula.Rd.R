library(psycho)


### Name: get_formula
### Title: Get formula of models.
### Aliases: get_formula

### ** Examples

library(psycho)
library(lme4)

fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")
fit <- lm(hp ~ wt, data = mtcars)

get_formula(fit)



