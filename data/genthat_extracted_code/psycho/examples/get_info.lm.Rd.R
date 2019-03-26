library(psycho)


### Name: get_info.lm
### Title: Get information about models.
### Aliases: get_info.lm

### ** Examples

library(psycho)
library(lme4)

fit <- lm(vs ~ wt, data = mtcars, family = "binomial")

info <- get_info(fit)
info

#



