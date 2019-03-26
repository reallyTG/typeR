library(ICAFF)


### Name: ICA
### Title: Finding a minimum value for the optimization variables of a cost
###   function.
### Aliases: ICA
### Keywords: optimize

### ** Examples


## --------cost function: f(x,y) = x * sin(4 * x) + 1.1 * y * sin(2 * y)
## --------search region: -10 <= x, y <= 10

cost <- function(x) {
  x[1] * sin(4 * x[1]) + 1.1 * x[2] * sin(2 * x[2])
}

ICAout <- ICA(cost, nvar = 2, ncountries = 80, nimp = 10,
              maxiter = 100, lb = -10, ub = 10, 
              beta = 2, P_revolve = 0.3, zeta = 0.02)

summary(ICAout)     ## same as the print method
coef(ICAout)        ## get the position of the minimum
cost(coef(ICAout))  ## cost at the minimum
plot(ICAout)        ## show the history of the process




