library(inlabru)


### Name: deltaIC
### Title: Summarise DIC and WAIC from 'lgcp' objects.
### Aliases: deltaIC

### ** Examples


## No test: 
# Generate some data
input.df <- data.frame(x=cos(1:10))
input.df <- within(input.df, y <- 5 + 2*cos(1:10) + rnorm(10, mean=0, sd=0.1))

# Fit two models
fit <- bru(y ~ x, "gaussian", input.df)
fit2 <- bru(y ~ x, "Poisson", input.df)

# Compare DIC

deltaIC(fit, fit2)
## End(No test)



