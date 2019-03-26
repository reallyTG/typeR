library(extremefit)


### Name: rburr.dependent
### Title: Generate Burr dependent data
### Aliases: rburr.dependent

### ** Examples

theta <- function(t){
   1/2*(1/10+sin(pi*t))*(11/10-1/2*exp(-64*(t-1/2)^2))
 }
n <- 200
t <- 1:n/n
Theta <- theta(t)
plot(theta)
alpha <- 0.6
Burr.dependent <- rburr.dependent(n, 1/Theta, 1, alpha)





