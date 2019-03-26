library(survival)


### Name: levels.Surv
### Title: Return the states of a multi-state Surv object
### Aliases: levels.Surv
### Keywords: survival

### ** Examples

y1 <- Surv(c(1,5, 9, 17,21, 30),
           factor(c(0, 1, 2,1,0,2), 0:2, c("censored", "progression", "death")))
levels(y1)

y2 <- Surv(1:6, rep(0:1, 3))
y2
levels(y2)



