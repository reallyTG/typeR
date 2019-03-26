context('search functions')

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


test_that('regression simulation, grid search', {
    test <- grid_search(lm_test, params=list(N=c(200, 300), b1=c(.15, .25)),
        n.iter=10, output='data.frame')

    expect_equal(class(test$results), 'data.frame')
    expect_equal(nrow(test$results), 40)
    expect_equivalent(summary(test), expand.grid(N=c(200, 300), b1=c(.15, .25), n.iter=10,
        KEEP.OUT.ATTRS=FALSE))
})


test_that('regression simulation, random search', {
    test <- random_search(lm_test, params=list(N=seq(200, 300),
        b1=c(lower=.15, upper=.25)), n.sample=20, n.iter=1, output='data.frame')

    expect_equal(class(test$results), 'data.frame')
    expect_equal(nrow(test$results), 20)
    expect_equal(nrow(test$tests), 20)
})




