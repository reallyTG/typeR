library(homeR)


### Name: bhm
### Title: Bayesian Heating Model
### Aliases: bhm

### ** Examples

set.seed(1111)

# Simple, but unrealistic parameters
K <- 1
tb <- 1
DHW <- 1
sigma <- 1e-2
temps <- tb + c(-2, -1, 0, 1)

# With daily measurements
E <- K * pmax(tb - temps, 0) + DHW + rnorm(length(temps), 0, sigma)
fourDayData <- data.frame(E = E, T = temps)
fourDayData
## Not run: 
##D fit <- bhm(E ~ T, fourDayData)
##D coef(fit)
##D resid(fit)
## End(Not run)

# With two-day measurements
fourTimesTwoDayData <- with(fourDayData,
                            data.frame(E = 2 * E,
                            T = I(lapply(T, function(x) c(x, x)))))
fit2 <- bhm(E ~ T, fourTimesTwoDayData)
coef(fit2)
resid(fit2)



