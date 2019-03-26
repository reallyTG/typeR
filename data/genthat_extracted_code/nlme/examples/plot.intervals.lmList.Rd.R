library(nlme)


### Name: plot.intervals.lmList
### Title: Plot lmList Confidence Intervals
### Aliases: plot.intervals.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
plot(intervals(fm1))



