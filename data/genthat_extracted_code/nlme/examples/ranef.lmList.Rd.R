library(nlme)


### Name: ranef.lmList
### Title: Extract lmList Random Effects
### Aliases: random.effects.lmList ranef.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
ranef(fm1)
random.effects(fm1)              # same as above



