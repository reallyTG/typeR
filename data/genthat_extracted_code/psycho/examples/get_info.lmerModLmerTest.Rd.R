library(psycho)


### Name: get_info.lmerModLmerTest
### Title: Get information about models.
### Aliases: get_info.lmerModLmerTest

### ** Examples

library(psycho)
library(lme4)

fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")

info <- get_info(fit)
info

#



