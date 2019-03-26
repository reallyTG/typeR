library(psycho)


### Name: format_formula
### Title: Clean and format formula.
### Aliases: format_formula

### ** Examples

library(psycho)
library(lme4)

fit <- lme4::glmer(vs ~ wt + (1 | gear), data = mtcars, family = "binomial")
fit <- lm(hp ~ wt, data = mtcars)

format_formula(get_formula(fit))



