library(flexPM)


### Name: flexPM
### Title: Flexible Modeling of Survival Data
### Aliases: flexPM
### Keywords: models survival

### ** Examples

# Simulated data from a normal distribution 

n <- 1000
x1 <- rnorm(n)
x2 <- runif(n)


# non-censored, non-truncated data

t <- rnorm(n, 2 + 3*x1, 1 + x2) # time variable
m1 <- flexPM(Surv(t) ~ x1 + x2)


# right-censored data

c <- rnorm(n,3,3) # censoring variable
y <- pmin(t,c)    # observed outcome
d <- (t <= c)     # 1 = observed, 0 = censored
m2 <- flexPM(Surv(y,d) ~ x1 + x2)


# right-censored, left-truncated data

z <- rnorm(n,-3,3) # truncating variable
w <- which(y > z)  # only observe if y > z
y <- y[w]; d <- d[w]; z <- z[w]; x1 <- x1[w]; x2 <- x2[w]
m3 <- flexPM(Surv(z,y,d) ~ x1 + x2)

################################################################

# m1, m2, m3 are not intended to be interpreted.
# Use predict() to obtain predictions.

# Note that the following are identical:
# summary(flexPM(Surv(y) ~ x1 + x2))
# summary(flexPM(Surv(y, rep(1,length(y))) ~ x1 + x2))
# summary(flexPM(Surv(rep(-Inf,length(y)), y, rep(1,length(y))) ~ x1 + x2))

################################################################

# Use the logLik, AIC and BIC for model selection 
# (choice of df, inclusion/exclusion of covariates)

models <- list(
  flexPM(Surv(z,y,d) ~ x1 + x2, df = 1, degree = 1),
  flexPM(Surv(z,y,d) ~ x1 + x2, df = 3),
  flexPM(Surv(z,y,d) ~ x1 + x2 + I(x1^2) + I(x2^2), df = 1, degree = 1),
  flexPM(Surv(z,y,d) ~ x1 + x2 + I(x1^2) + I(x2^2), df = 3),
  flexPM(Surv(z,y,d) ~ x1 * x2, df = 5)
)

my_final_model <- models[[which.min(sapply(models, function(x) x$AIC))]]
summary(my_final_model)




