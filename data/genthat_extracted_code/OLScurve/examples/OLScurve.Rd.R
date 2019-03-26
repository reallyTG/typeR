library(OLScurve)


### Name: OLScurve
### Title: Ordinary least squares growth curve trajectories
### Aliases: OLScurve plot.OLScurve print.OLScurve
### Keywords: OLS, growth

### ** Examples

## Not run: 
##D ##linear
##D data <- t(t(matrix(rnorm(1000),200)) + 1:5)
##D mod1 <- OLScurve(~ time, data = data)
##D mod1 #unadjusted variances
##D print(mod1, adjust = TRUE) #adjusted
##D plot(mod1)
##D 
##D ##quadratic
##D data <- t(t(matrix(rnorm(1000),200)) + (0:4)^2)
##D mod2 <- OLScurve(~ time + I(time^2), data = data)
##D mod2
##D plot(mod2)
##D 
##D ##sqrt
##D data <- t(t(matrix(rnorm(1000),200)) + 20*sqrt(5:1))
##D mod3 <- OLScurve(~ sqrt(time), data = data)
##D mod3
##D plot(mod3)
##D 
##D ##exponential
##D data <- t(t(matrix(rnorm(1000,0,5),200)) + exp(0:4))
##D mod4 <- OLScurve(~ exp(time), data = data)
##D mod4
##D plot(mod4)
##D 
##D ##combination
##D data <- t(t(matrix(rnorm(1000),200)) + 20*sqrt(1:5))
##D mod5 <- OLScurve(~ time + sqrt(time), data = data)
##D mod5
##D plot(mod5)
##D 
##D ##piecewise (global linear trend with linear shift at time point 3)
##D data <- t(t(matrix(rnorm(1000),200)) + (0:4)^2)
##D time <- data.frame(time1 = c(0,1,2,3,4), time2 = c(0,0,0,1,2))
##D mod6 <- OLScurve(~ time1 + time2, data, time=time)
##D mod6
##D plot(mod6)
##D 
##D ##two group analysis with linear trajectories
##D data1 <- t(t(matrix(rnorm(500),100)) + 1:5)
##D data2 <- t(t(matrix(rnorm(500),100)) + 9:5)
##D data <- rbind(data1,data2)
##D group <- c(rep('male',100),rep('female',100))
##D 
##D mod <- OLScurve(~ time, data)
##D print(mod,group)
##D plot(mod,group)
## End(Not run)



