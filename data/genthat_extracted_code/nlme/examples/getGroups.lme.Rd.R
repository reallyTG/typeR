library(nlme)


### Name: getGroups.lme
### Title: Extract lme Object Groups
### Aliases: getGroups.lme
### Keywords: models

### ** Examples

fm1 <- lme(pixel ~ day + day^2, Pixel,
  random = list(Dog = ~day, Side = ~1))
getGroups(fm1, level = 1:2)



