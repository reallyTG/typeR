library(broom)


### Name: tidy.cv.glmnet
### Title: Tidy a(n) cv.glmnet object
### Aliases: tidy.cv.glmnet

### ** Examples


if (requireNamespace("glmnet", quietly = TRUE)) {

    library(glmnet)
    set.seed(27)

    nobs <- 100
    nvar <- 50
    real <- 5

    x <- matrix(rnorm(nobs * nvar), nobs, nvar)
    beta <- c(rnorm(real, 0, 1), rep(0, nvar - real))
    y <- c(t(beta) %*% t(x)) + rnorm(nvar, sd = 3)

    cvfit1 <- cv.glmnet(x,y)

    tidy(cvfit1)
    glance(cvfit1)

    library(ggplot2)
    tidied_cv <- tidy(cvfit1)
    glance_cv <- glance(cvfit1)

    # plot of MSE as a function of lambda
    g <- ggplot(tidied_cv, aes(lambda, estimate)) + geom_line() + scale_x_log10()
    g

    # plot of MSE as a function of lambda with confidence ribbon
    g <- g + geom_ribbon(aes(ymin = conf.low, ymax = conf.high), alpha = .25)
    g

    # plot of MSE as a function of lambda with confidence ribbon and choices
    # of minimum lambda marked
    g <- g + geom_vline(xintercept = glance_cv$lambda.min) +
        geom_vline(xintercept = glance_cv$lambda.1se, lty = 2)
    g

    # plot of number of zeros for each choice of lambda
    ggplot(tidied_cv, aes(lambda, nzero)) + geom_line() + scale_x_log10()

    # coefficient plot with min lambda shown
    tidied <- tidy(cvfit1$glmnet.fit)
    ggplot(tidied, aes(lambda, estimate, group = term)) + scale_x_log10() +
        geom_line() +
        geom_vline(xintercept = glance_cv$lambda.min) +
        geom_vline(xintercept = glance_cv$lambda.1se, lty = 2)
}




