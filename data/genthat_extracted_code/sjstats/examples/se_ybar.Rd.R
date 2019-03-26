library(sjstats)


### Name: se_ybar
### Title: Standard error of sample mean for mixed models
### Aliases: se_ybar

### ** Examples

library(lme4)
fit <- lmer(Reaction ~ 1 + (1 | Subject), sleepstudy)
se_ybar(fit)




