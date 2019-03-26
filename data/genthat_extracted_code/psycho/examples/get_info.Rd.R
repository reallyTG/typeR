library(psycho)


### Name: get_info
### Title: Get information about objects.
### Aliases: get_info

### ** Examples

library(psycho)
library(lme4)

fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")

info <- get_info(fit)
info



