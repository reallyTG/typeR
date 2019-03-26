library(PMwR)


### Name: returns
### Title: Compute Returns
### Aliases: returns .returns p_returns returns.default returns.zoo
###   print.p_returns toLatex.p_returns toHTML.p_returns

### ** Examples

x <- 101:105
returns(x)
returns(x, pad = NA)
returns(x, pad = NA, lag = 2)


## monthly returns
t <- seq(as.Date("2012-06-15"), as.Date("2012-12-31"), by = "1 day")
x <- seq_along(t) + 1000
returns(x, t = t, period = "month")
returns(x, t = t, period = "month", complete.first = FALSE)

### formatting
print(returns(x, t = t, period = "month"), plus = TRUE, digits = 0)

## returns per year (annualised returns)
returns(x, t = t, period = "ann")  ## less than one year, not annualised
returns(x, t = t, period = "ann!") ## less than one year, *but* annualised

is.ann <- function(x)
    attr(x, "is.annualised")

is.ann(returns(x, t = t, period = "ann"))   ## FALSE
is.ann(returns(x, t = t, period = "ann!"))  ## TRUE


## with weights and fixed rebalancing times
prices <- cbind(p1 = 101:105,
                p2 = rep(100, 5))
R <- returns(prices, weights = c(0.5, 0.5), rebalance.when = 1)
## ... => resulting weights
h <- attr(R, "holdings")
h*prices / rowSums(h*prices)



