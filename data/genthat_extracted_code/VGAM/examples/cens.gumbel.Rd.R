library(VGAM)


### Name: cens.gumbel
### Title: Censored Gumbel Distribution
### Aliases: cens.gumbel
### Keywords: models regression

### ** Examples

# Example 1
ystar <- venice[["r1"]]  # Use the first order statistic as the response
nn <- length(ystar)
L <- runif(nn, 100, 104)  # Lower censoring points
U <- runif(nn, 130, 135)  # Upper censoring points
y <- pmax(L, ystar)  # Left  censored
y <- pmin(U, y)      # Right censored
extra <- list(leftcensored = ystar < L, rightcensored = ystar > U)
fit <- vglm(y ~ scale(year), data = venice, trace = TRUE, extra = extra,
            fam = cens.gumbel(mean = FALSE, perc = c(5, 25, 50, 75, 95)))
coef(fit, matrix = TRUE)
head(fitted(fit))
fit@extra

# Example 2: simulated data
nn <- 1000
ystar <- rgumbel(nn, loc = 1, scale = exp(0.5))  # The uncensored data
L <- runif(nn, -1, 1)  # Lower censoring points
U <- runif(nn,  2, 5)  # Upper censoring points
y <- pmax(L, ystar)  # Left  censored
y <- pmin(U, y)      # Right censored
## Not run: par(mfrow = c(1, 2)); hist(ystar); hist(y);
extra <- list(leftcensored = ystar < L, rightcensored = ystar > U)
fit <- vglm(y ~ 1, trace = TRUE, extra = extra, fam = cens.gumbel)
coef(fit, matrix = TRUE)



