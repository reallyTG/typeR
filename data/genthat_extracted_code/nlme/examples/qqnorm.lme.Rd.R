library(nlme)


### Name: qqnorm.lme
### Title: Normal Plot of Residuals or Random Effects from an lme Object
### Aliases: qqnorm.lm qqnorm.lme qqnorm.lmList qqnorm.nls
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
## normal plot of standardized residuals by gender
qqnorm(fm1, ~ resid(., type = "p") | Sex, abline = c(0, 1))
## normal plots of random effects
qqnorm(fm1, ~ranef(.))



