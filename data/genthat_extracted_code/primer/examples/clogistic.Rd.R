library(primer)


### Name: clogistic
### Title: Continuous Logistic Growth
### Aliases: clogistic
### Keywords: methods

### ** Examples

library(deSolve)
p <- c(1,.01)
time <- 1:10
initialN <- 10
out <- ode(y=initialN, times=time,
             func=clogistic, parms=p) 
plot(time, out[,-1], type='l')



