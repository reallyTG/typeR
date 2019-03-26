library(paramtest)


### Name: grid_search
### Title: Run a function iteratively using a grid search approach for
###   parameter values, with options for parallel processing.
### Aliases: grid_search

### ** Examples

lm_test <- function(iter, N, b0, b1) {
    x <- rnorm(N, 0, 1)
    y <- rnorm(N, b0 + b1*x, sqrt(1 - b1^2))
    data <- data.frame(y, x)
    model <- lm(y ~ x, data)

    # capture output from model summary
    est <- coef(summary(model))['x', 'Estimate']
    se <- coef(summary(model))['x', 'Std. Error']
    p <- coef(summary(model))['x', 'Pr(>|t|)']

    return(c(xm=mean(x), xsd=sd(x), ym=mean(y), ysd=sd(y), est=est, se=se, p=p,
        sig=est > 0 & p <= .05))
}

# test power for sample size N=200 and N=300, with 500 iterations for each
power_sim <- grid_search(lm_test, params=list(N=c(200, 300)), n.iter=500, b0=0, b1=.15)



