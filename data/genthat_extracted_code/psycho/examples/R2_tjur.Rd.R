library(psycho)


### Name: R2_tjur
### Title: Tjur's (2009) coefficient of determination.
### Aliases: R2_tjur

### ** Examples

library(psycho)
library(lme4)

fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")
R2_tjur(fit)



