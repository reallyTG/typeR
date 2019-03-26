library(nlme)


### Name: intervals.lme
### Title: Confidence Intervals on lme Parameters
### Aliases: intervals.lme print.intervals.lme
### Keywords: models

### ** Examples

fm1 <- lme(distance ~ age, Orthodont, random = ~ age | Subject)
intervals(fm1)



