library(eha)


### Name: check.surv
### Title: Check the integrity of survival data.
### Aliases: check.surv
### Keywords: manip survival

### ** Examples


xx <- data.frame(enter = c(0, 1), exit = c(1.5, 3), event = c(0, 1), id =
c(1,1))
check.surv(xx$enter, xx$exit, xx$event, xx$id)




