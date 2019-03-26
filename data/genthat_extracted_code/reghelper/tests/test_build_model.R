context('build_model function')

# takes model and returns coefficient for a given variable/row number, rounded
# to 'digits' decimal places
get_coef <- function(model, row, digits=3) {
    return(round(coef(model)[row, 1], digits))
}


test_that('lm with no predictors works', {
    set.seed(345)
    y <- rnorm(100)
    
    data <- data.frame(y)  # testthat doesn't seem to play nicely with
                           # finding the variables in the parent
                           # environment (with no data argument)
    
    model <- summary(lm(y ~ 1, data))
    b_model <- build_model(y, data=data)
    
    expect_equal(length(b_model$formulas), 1)
    expect_equal(length(b_model$models), 1)
    
    b_summ <- summary(b_model)

    expect_equal(nrow(b_summ$residuals), 1)
    
    # check coefficients
    expect_equal(round(coef(b_summ, 1)[1, 1], 3), get_coef(model, 1))
})


test_that('2 block lm, no interaction, works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 + x2 + rnorm(100)
    
    data <- data.frame(x1, x2, y)  # testthat doesn't seem to play nicely with
                                   # finding the variables in the parent
                                   # environment (with no data argument)
    
    model1 <- summary(lm(y ~ x1, data))
    model2 <- summary(lm(y ~ x1 + x2, data))
    
    b_model <- build_model(y, x1, x2, data=data)
    
    expect_equal(length(b_model$formulas), 2)
    expect_equal(length(b_model$models), 2)
    
    b_summ <- summary(b_model)
    
    expect_equal(nrow(b_summ$residuals), 2)
    
    # check coefficients
    expect_equal(round(coef(b_summ, 1)['x1', 1], 3), get_coef(model1, 'x1'))
    expect_equal(round(coef(b_summ, 2)['x1', 1], 3), get_coef(model2, 'x1'))
    expect_equal(round(coef(b_summ, 2)['x2', 1], 3), get_coef(model2, 'x2'))
    
    # check r-squared
    expect_equal(round(b_summ$overall[1, 1], 3),
        round(model1$r.squared, 3))
    expect_equal(round(b_summ$overall[2, 1], 3),
        round(model2$r.squared, 3))
})


test_that('2 block lm, with interaction, works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    data <- data.frame(x1, x2, y)  # testthat doesn't seem to play nicely with
                                   # finding the variables in the parent
                                   # environment (with no data argument)
    
    model1 <- summary(lm(y ~ x1 + x2, data))
    model2 <- summary(lm(y ~ x1 * x2, data))
    
    b_model <- build_model(y, c(x1, x2), x1 * x2, data=data)
    
    expect_equal(length(b_model$formulas), 2)
    expect_equal(length(b_model$models), 2)
    
    b_summ <- summary(b_model)
    
    expect_equal(nrow(b_summ$residuals), 2)
    
    # check coefficients
    expect_equal(round(coef(b_summ, 1)['x1', 1], 3), get_coef(model1, 'x1'))
    expect_equal(round(coef(b_summ, 1)['x2', 1], 3), get_coef(model1, 'x2'))
    expect_equal(round(coef(b_summ, 2)['x1', 1], 3), get_coef(model2, 'x1'))
    expect_equal(round(coef(b_summ, 2)['x2', 1], 3), get_coef(model2, 'x2'))
    expect_equal(round(coef(b_summ, 2)['x1:x2', 1], 3),
        get_coef(model2, 'x1:x2'))
    
    # check r-squared
    expect_equal(round(b_summ$overall[1, 1], 3),
        round(model1$r.squared, 3))
    expect_equal(round(b_summ$overall[2, 1], 3),
        round(model2$r.squared, 3))
})


test_that('3 block lm, with interaction, works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    x3 <- rnorm(100)
    
    set.seed(456)
    y <- x1 * x2 * x3 + rnorm(100)
    
    data <- data.frame(x1, x2, x3, y)
        # testthat doesn't seem to play nicely with finding the variables in the
        # parent environment (with no data argument)
    
    model1 <- summary(lm(y ~ x1 + x2 + x3, data))
    model2 <- summary(lm(y ~ x1 * x2 + x1 * x3 + x2 * x3, data))
    model3 <- summary(lm(y ~ x1 * x2 * x3, data))
    
    b_model <- build_model(y, c(x1, x2, x3), c(x1 * x2, x1 * x3, x2 * x3),
        x1 * x2 * x3, data=data)
    
    expect_equal(length(b_model$formulas), 3)
    expect_equal(length(b_model$models), 3)
    
    b_summ <- summary(b_model)
    
    expect_equal(nrow(b_summ$residuals), 3)
    
    # check coefficients
    expect_equal(round(coef(b_summ, 1)['x1', 1], 3), get_coef(model1, 'x1'))
    expect_equal(round(coef(b_summ, 1)['x2', 1], 3), get_coef(model1, 'x2'))
    expect_equal(round(coef(b_summ, 1)['x3', 1], 3), get_coef(model1, 'x3'))
    
    expect_equal(round(coef(b_summ, 2)['x1', 1], 3), get_coef(model2, 'x1'))
    expect_equal(round(coef(b_summ, 2)['x2', 1], 3), get_coef(model2, 'x2'))
    expect_equal(round(coef(b_summ, 2)['x3', 1], 3), get_coef(model2, 'x3'))
    expect_equal(round(coef(b_summ, 2)['x1:x2', 1], 3),
        get_coef(model2, 'x1:x2'))
    expect_equal(round(coef(b_summ, 2)['x1:x3', 1], 3),
        get_coef(model2, 'x1:x3'))
    expect_equal(round(coef(b_summ, 2)['x2:x3', 1], 3),
        get_coef(model2, 'x2:x3'))
    
    expect_equal(round(coef(b_summ, 3)['x1', 1], 3), get_coef(model3, 'x1'))
    expect_equal(round(coef(b_summ, 3)['x2', 1], 3), get_coef(model3, 'x2'))
    expect_equal(round(coef(b_summ, 3)['x3', 1], 3), get_coef(model3, 'x3'))
    expect_equal(round(coef(b_summ, 3)['x1:x2', 1], 3),
        get_coef(model3, 'x1:x2'))
    expect_equal(round(coef(b_summ, 3)['x1:x3', 1], 3),
        get_coef(model3, 'x1:x3'))
    expect_equal(round(coef(b_summ, 3)['x2:x3', 1], 3),
        get_coef(model3, 'x2:x3'))
    expect_equal(round(coef(b_summ, 3)['x1:x2:x3', 1], 3),
        get_coef(model3, 'x1:x2:x3'))
    
    # check r-squared
    expect_equal(round(b_summ$overall[1, 1], 3),
        round(model1$r.squared, 3))
    expect_equal(round(b_summ$overall[2, 1], 3),
        round(model2$r.squared, 3))
    expect_equal(round(b_summ$overall[3, 1], 3),
        round(model3$r.squared, 3))
})


test_that('opts parameter passes along arguments', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 + x2 + rnorm(100)
    
    data <- data.frame(x1, x2, y)

    model1 <- summary(lm(y ~ x1 + x2, data))
    model2 <- summary(lm(y ~ x1 + x2, data, subset=1:50))
    
    b_model1 <- build_model(y, x1, x2, data=data)
    b_model2 <- build_model(y, x1, x2, data=data, opts=list(subset=1:50))
    
    b_summ1 <- summary(b_model1)
    b_summ2 <- summary(b_model2)
    
    # check coefficients
    expect_equal(round(coef(b_summ1, 2)['x1', 1], 3), get_coef(model1, 'x1'))
    expect_equal(round(coef(b_summ1, 2)['x2', 1], 3), get_coef(model1, 'x2'))
    expect_equal(round(coef(b_summ2, 2)['x1', 1], 3), get_coef(model2, 'x1'))
    expect_equal(round(coef(b_summ2, 2)['x2', 1], 3), get_coef(model2, 'x2'))
})


test_that('2 block aov works', {
    x1 <- c(rep(0, 50), rep(1, 50))
    x2 <- rep(c(rep(0, 25), rep(1, 25)), 2)
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    x1 <- factor(x1)
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model1 <- summary(aov(y ~ x1 + x2, data))[[1]]
    model2 <- summary(aov(y ~ x1 * x2, data))[[1]]
    
    b_model <- build_model(y, c(x1, x2), x1 * x2, data=data, model='aov')
    
    expect_equal(length(b_model$formulas), 2)
    expect_equal(length(b_model$models), 2)
    
    b_summ <- summary(b_model)
    b_summaries <- b_summ$summaries
    
    expect_equal(nrow(b_summ$residuals), 2)
    
    # check F values
    expect_equal(round(b_summaries[[1]][[1]]['x1', 4], 3),
        round(model1['x1', 4], 3))
    expect_equal(round(b_summaries[[1]][[1]]['x2', 4], 3),
        round(model1['x2', 4], 3))
    expect_equal(round(b_summaries[[2]][[1]]['x1', 4], 3),
        round(model2['x1', 4], 3))
    expect_equal(round(b_summaries[[2]][[1]]['x2', 4], 3),
        round(model2['x2', 4], 3))
    expect_equal(round(b_summaries[[2]][[1]]['x1:x2', 4], 3),
        round(model2['x1:x2', 4], 3))
})


test_that('2 block glm works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    rand <- rnorm(100)
    
    y <- as.numeric(x1 * x2 > mean(x1 * x2) & rand > mean(rand))
    
    data <- data.frame(x1, x2, y)
    
    model1 <- summary(glm(y ~ x1 + x2, data, family='binomial'))
    model2 <- summary(glm(y ~ x1 * x2, data, family='binomial'))
    
    b_model <- build_model(y, c(x1, x2), x1 * x2, data=data, model='glm',
        opts=list(family='binomial'))
    
    expect_equal(length(b_model$formulas), 2)
    expect_equal(length(b_model$models), 2)
    
    b_summ <- summary(b_model)
    
    expect_equal(nrow(b_summ$residuals), 2)
    
    # check coefficients
    expect_equal(round(coef(b_summ, 1)['x1', 1], 3), get_coef(model1, 'x1'))
    expect_equal(round(coef(b_summ, 1)['x2', 1], 3), get_coef(model1, 'x2'))
    expect_equal(round(coef(b_summ, 2)['x1', 1], 3), get_coef(model2, 'x1'))
    expect_equal(round(coef(b_summ, 2)['x2', 1], 3), get_coef(model2, 'x2'))
    expect_equal(round(coef(b_summ, 2)['x1:x2', 1], 3),
        get_coef(model2, 'x1:x2'))
})


