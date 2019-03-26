library(nlme)


### Name: ranef.lme
### Title: Extract lme Random Effects
### Aliases: ranef.lme random.effects.lme print.ranef.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
ranef(fm1)
random.effects(fm1)             # same as above
random.effects(fm1, augFrame = TRUE)



