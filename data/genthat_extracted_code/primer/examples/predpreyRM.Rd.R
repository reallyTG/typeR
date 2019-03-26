library(primer)


### Name: predpreyRM
### Title: Rosenzweig-MacArthur Predator-prey Model
### Aliases: predpreyRM
### Keywords: methods

### ** Examples

library(deSolve)
pars <- c(b = .8, e = 0.07, s = .2, w = 5, D = 400, alpha = 0.001)
Time <- 50
RM1 <- ode(c(900,120), 1:Time, predpreyRM, pars)
matplot(1:Time, RM1[,-1], type='l')



