context('sig_regions function')

test_that('disordinal interaction finds two points', {
    set.seed(123)
    x1 <- rnorm(100)
    
    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    regions <- sig_regions(model)
    
    expect_false(is.na(regions['lower']))
    expect_false(is.na(regions['upper']))
})


test_that('ordinal interaction finds lower point', {
    set.seed(123)
    x1 <- rnorm(100)
    
    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- x1 + x2 - .8 * x1 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    regions <- sig_regions(model)
    
    expect_false(is.na(regions['lower']))
    expect_true(is.na(regions['upper']))
})


test_that('ordinal interaction finds upper point', {
    set.seed(123)
    x1 <- rnorm(100)
    
    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- x1 - x2 - .8 * x1 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    regions <- sig_regions(model)
    
    expect_true(is.na(regions['lower']))
    expect_false(is.na(regions['upper']))
})


test_that('non-significant interaction finds no points', {
    set.seed(123)
    x1 <- rnorm(100)
    
    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- .2 * x1 + .2 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    regions <- sig_regions(model)
    
    expect_true(is.na(regions['lower']))
    expect_true(is.na(regions['upper']))
})


test_that('binomial glm works', {
    set.seed(234)
    x1 <- rnorm(100)
    
    x2 <- c(rep(0, 50), rep(1, 50))
    
    pi <- exp(x1 * x2) / (1 + exp(x1 * x2))
    
    y <- rbinom(n=100, size=1, prob=pi)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- glm(y ~ x1 * x2, data, family='binomial')
    regions <- sig_regions(model)
    
    expect_false(is.na(regions['lower']))
    expect_false(is.na(regions['upper']))
})



