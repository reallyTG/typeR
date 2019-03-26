library(rsq)


### Name: hschool
### Title: Attendance Behavior of High School Juniors
### Aliases: hschool
### Keywords: datasets

### ** Examples

data(hschool)
summary(hschool)
head(hschool)

require(MASS)
absfit <- glm.nb(daysabs~school+male+math+langarts,data=hschool)
summary(absfit)
rsq(absfit)
rsq(absfit,adj=TRUE)

rsq.partial(absfit)



