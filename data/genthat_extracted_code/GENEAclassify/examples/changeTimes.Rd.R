library(GENEAclassify)


### Name: changeTimes
### Title: Select Times as Segment Changepoints
### Aliases: changeTimes
### Keywords: internal

### ** Examples


library(changepoint)
d1 <- c(54, 30, 27, 53, 100, 204, 197)
d2 <- c(67, 64, 70, 79, 69, 60, 54)
c1 <- cpt.var(d1, penalty = "SIC", pen.value = 1e-3, method = "PELT")
c2 <- cpt.var(d2, penalty = "SIC", pen.value = 1e-3, method = "PELT")
changeTimes(time = 0:6, intervalseconds = 30, 
    changeupdown = c1, changedegrees = c2)



