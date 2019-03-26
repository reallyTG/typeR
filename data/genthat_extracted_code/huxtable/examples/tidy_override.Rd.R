library(huxtable)


### Name: tidy_override
### Title: Override a model's 'tidy' output
### Aliases: tidy_override tidy.tidy_override glance.tidy_override
###   nobs.tidy_override

### ** Examples

if (! requireNamespace("broom")) {
  stop("Please install 'broom' to run this example.")
}

lm1 <- lm(mpg ~ cyl, mtcars)
fixed_lm1 <- tidy_override(lm1,
      p.value = c(.04, .12),
      glance = list(r.squared = 0.99))

broom::tidy(fixed_lm1)

cbind(huxreg(fixed_lm1), huxreg(lm1))



