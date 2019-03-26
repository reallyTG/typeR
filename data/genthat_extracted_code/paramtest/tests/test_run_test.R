context('run_test function')

lm_test <- function(iter, N, b1, b0=0, xm=0, xsd=1) {
    obs <- rep(1:N)

    x <- rnorm(N, xm, xsd)
    y <- rnorm(N, b0 + b1*x, sqrt(1 - b1^2))

    data <- data.frame(obs, y, x)
    model <- lm(y ~ x, data)

    est <- coef(summary(model))['x', 'Estimate']
    se <- coef(summary(model))['x', 'Std. Error']
    p <- coef(summary(model))['x', 'Pr(>|t|)']

    return(c(xm=mean(x), xsd=sd(x), ym=mean(y), ysd=sd(y), est=est, se=se, p=p,
        sig=est > 0 & p <= .05))
}

lm_test_boot <- function(data, indices, N, b1) {
    model <- lm(y ~ x, data[indices, ])

    est <- coef(summary(model))['x', 'Estimate']
    se <- coef(summary(model))['x', 'Std. Error']
    p <- coef(summary(model))['x', 'Pr(>|t|)']

    return(c(est=est, se=se, p=p, sig=est > 0 & p <= .05))
}

simple_test <- function(X, N) {
    return(c(mean=mean(N)))
}


test_that('regression simulation, data frame output', {
    params <- expand.grid(N=c(200, 300), b1=c(.15, .25))

    test <- run_test(lm_test, params=params, n.iter=10, output='data.frame')

    expect_equal(class(test$results), 'data.frame')
    expect_equal(nrow(test$results), 40)
})


test_that('regression simulation, list output', {
    params <- expand.grid(N=c(200, 300), b1=c(.15, .25))

    test <- run_test(lm_test, params=params, n.iter=10, output='list')

    expect_equal(class(test$results), 'list')
    expect_equal(length(test$results), 40)
})


test_that('bootstrap simulation, data frame output', {
    x <- rnorm(200, 0, 1)
    y <- rnorm(200, .15*x, sqrt(1 - .15^2))
    df <- data.frame(obs=1:200, y, x)

    params <- expand.grid(N=c(200, 300))

    test <- run_test(lm_test_boot, params=params, n.iter=10, output='data.frame',
        boot=TRUE, bootParams=list(data=df), b1=.15)

    expect_equal(class(test$results), 'data.frame')
    expect_equal(nrow(test$results), 20)
})






