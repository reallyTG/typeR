library(Rbent)


### Name: rbentfit
### Title: rank estimation for bent line regression
### Aliases: rbentfit
### Keywords: rbentfit

### ** Examples

n <- 150
x <- runif(n, 0, 4)
z <- rnorm(n, 1, 1)
y <- 1 + 0.5*z + 1.5*x  - 3 *pmax(x-2, 0)  + rt(n, 2)
rbentfit(y, cbind(1,z), x, bet.ini = c(0, 1, 1, -2), tau.ini = 1)

# for the example of  MRS data
data(data_mrs)
x <- log(data_mrs$mass)
y <- log(data_mrs$speed)
z <- data_mrs$hopper
tau.ini <- 3
dat.new <- data.frame(y=y, z1=z, z2 = x, z3=pmax(x-tau.ini,0))
library(Rfit)
fit.ini <- rfit(y~ z1 + z2 +z3, data= dat.new)   # with intercept
bet.ini <- fit.ini$coef
fit.rank <- rbentfit(y, cbind(1,z), x, bet.ini, tau.ini)



