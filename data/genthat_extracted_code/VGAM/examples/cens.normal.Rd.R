library(VGAM)


### Name: cens.normal
### Title: Censored Normal Distribution
### Aliases: cens.normal cennormal
### Keywords: models regression

### ** Examples

## Not run: 
##D cdata <- data.frame(x2 = runif(nn <- 1000))  # ystar are true values
##D cdata <- transform(cdata, ystar = rnorm(nn, m = 100 + 15 * x2, sd = exp(3)))
##D with(cdata, hist(ystar))
##D cdata <- transform(cdata, L = runif(nn,  80,  90),  # Lower censoring points
##D                           U = runif(nn, 130, 140))  # Upper censoring points
##D cdata <- transform(cdata, y = pmax(L, ystar))  # Left  censored
##D cdata <- transform(cdata, y = pmin(U, y))      # Right censored
##D with(cdata, hist(y))
##D Extra <- list(leftcensored  = with(cdata, ystar < L),
##D               rightcensored = with(cdata, ystar > U))
##D fit1 <- vglm(y ~ x2, cens.normal, data = cdata, crit = "c", extra = Extra)
##D fit2 <- vglm(y ~ x2, tobit(Lower = with(cdata, L), Upper = with(cdata, U)),
##D             data = cdata, crit = "c", trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D max(abs(coef(fit1, matrix = TRUE) -
##D         coef(fit2, matrix = TRUE)))  # Should be 0
##D names(fit1@extra)
## End(Not run)



