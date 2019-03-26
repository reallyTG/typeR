library(primer)


### Name: thetalogistic
### Title: Continuous Theta-Logistic Growth
### Aliases: thetalogistic
### Keywords: methods

### ** Examples

library(deSolve)
p <- c(r=1,alpha=.01, theta=.5)
time <- seq(1,10, by=.1)
initialN <- 10
out <- ode(y=initialN, times=time, func=thetalogistic, parms=p) 
plot(time, out[,-1], type='l')



