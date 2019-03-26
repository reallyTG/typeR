context('cell_means function')

# takes model and returns coefficient for a given variable/row number, rounded
# to 'digits' decimal places
get_coef <- function(model, row, digits=3) {
    return(round(coef(model)[row, 1], digits))
}


test_that('lm with 2 continuous int. works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    model <- lm(y ~ x1 * x2)
    means <- cell_means(model, x1, x2)
    
    model_m1m1 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I((x2 - mean(x2)) + sd(x2))))
    expect_equal(round(means[1, 'value'], 3), get_coef(model_m1m1, 1))
    
    model_0m1 <- summary(lm(
        y ~ I(x1 - mean(x1)) * I((x2 - mean(x2)) + sd(x2))))
    expect_equal(round(means[2, 'value'], 3), get_coef(model_0m1, 1))
    
    model_p1m1 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I((x2 - mean(x2)) + sd(x2))))
    expect_equal(round(means[3, 'value'], 3), get_coef(model_p1m1, 1))
    
    
    model_m10 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I(x2 - mean(x2))))
    expect_equal(round(means[4, 'value'], 3), get_coef(model_m10, 1))
    
    model_00 <- summary(lm(
        y ~ I(x1 - mean(x1)) * I(x2 - mean(x2))))
    expect_equal(round(means[5, 'value'], 3), get_coef(model_00, 1))
    
    model_p10 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I(x2 - mean(x2))))
    expect_equal(round(means[6, 'value'], 3), get_coef(model_p10, 1))
    
    
    model_m1p1 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I((x2 - mean(x2)) - sd(x2))))
    expect_equal(round(means[7, 'value'], 3), get_coef(model_m1p1, 1))
    
    model_0p1 <- summary(lm(
        y ~ I(x1 - mean(x1)) * I((x2 - mean(x2)) - sd(x2))))
    expect_equal(round(means[8, 'value'], 3), get_coef(model_0p1, 1))
    
    model_p1p1 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I((x2 - mean(x2)) - sd(x2))))
    expect_equal(round(means[9, 'value'], 3), get_coef(model_p1p1, 1))
})


test_that('lm with continuous x 2-level categorical int. works', {
    set.seed(123)
    x1 <- rnorm(100)

    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    model <- lm(y ~ x1 * x2)
    means <- cell_means(model, x1, x2)
    
    model_m10 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * x2))
    expect_equal(round(means[1, 'value'], 3), get_coef(model_m10, 1))
    
    model_00 <- summary(lm(
        y ~ I(x1 - mean(x1)) * x2))
    expect_equal(round(means[2, 'value'], 3), get_coef(model_00, 1))
    
    model_p10 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * x2))
    expect_equal(round(means[3, 'value'], 3), get_coef(model_p10, 1))
    
    contrasts(x2) <- c(1, 0)
    model_m11 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * x2))
    expect_equal(round(means[4, 'value'], 3), get_coef(model_m11, 1))
    
    model_01 <- summary(lm(
        y ~ I(x1 - mean(x1)) * x2))
    expect_equal(round(means[5, 'value'], 3), get_coef(model_01, 1))
    
    model_p11 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * x2))
    expect_equal(round(means[6, 'value'], 3), get_coef(model_p11, 1))
})


test_that('lm with continuous x 3-level categorical int. works', {
    set.seed(123)
    x1 <- rnorm(150)
    
    x2 <- c(rep(0, 50), rep(1, 50), rep(2, 50))
    
    set.seed(345)
    y <- x1 * x2 + rnorm(150)
    
    x2 <- factor(x2)
    
    model <- lm(y ~ x1 * x2)
    means <- cell_means(model, x1, x2)
    
    model_m10 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * x2))
    expect_equal(round(means[1, 'value'], 3), get_coef(model_m10, 1))
    
    model_00 <- summary(lm(
        y ~ I(x1 - mean(x1)) * x2))
    expect_equal(round(means[2, 'value'], 3), get_coef(model_00, 1))
    
    model_p10 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * x2))
    expect_equal(round(means[3, 'value'], 3), get_coef(model_p10, 1))
    
    contrasts(x2) <- matrix(c(1, 0, 0, 0, 0, 1), ncol=2)
    model_m11 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * x2))
    expect_equal(round(means[4, 'value'], 3), get_coef(model_m11, 1))
    
    model_01 <- summary(lm(
        y ~ I(x1 - mean(x1)) * x2))
    expect_equal(round(means[5, 'value'], 3), get_coef(model_01, 1))
    
    model_p11 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * x2))
    expect_equal(round(means[6, 'value'], 3), get_coef(model_p11, 1))
    
    contrasts(x2) <- matrix(c(1, 0, 0, 0, 1, 0), ncol=2)
    model_m12 <- summary(lm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * x2))
    expect_equal(round(means[7, 'value'], 3), get_coef(model_m12, 1))
    
    model_02 <- summary(lm(
        y ~ I(x1 - mean(x1)) * x2))
    expect_equal(round(means[8, 'value'], 3), get_coef(model_02, 1))
    
    model_p12 <- summary(lm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * x2))
    expect_equal(round(means[9, 'value'], 3), get_coef(model_p12, 1))
})


test_that('collapsing over continuous variable works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    x3 <- rnorm(100)
    
    set.seed(456)
    y <- x1 * x2 * x3 + rnorm(100)
    
    model <- lm(y ~ x1 * x2 * x3)
    means <- cell_means(model, x1, x2)
    
    pts <- list(
        x1=c(mean(x1) - sd(x1), mean(x1), mean(x1) + sd(x1)),
        x2=c(mean(x2) - sd(x2), mean(x2), mean(x2) + sd(x2))
    )
    
    model_m1m1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][1]) * I(x3 - mean(x3))))
    expect_equal(round(means[1, 'value'], 3), get_coef(model_m1m1, 1))
    
    model_0m1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][1]) * I(x3 - mean(x3))))
    expect_equal(round(means[2, 'value'], 3), get_coef(model_0m1, 1))
    
    model_p1m1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][1]) * I(x3 - mean(x3))))
    expect_equal(round(means[3, 'value'], 3), get_coef(model_p1m1, 1))
    
    
    model_m10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][2]) * I(x3 - mean(x3))))
    expect_equal(round(means[4, 'value'], 3), get_coef(model_m10, 1))
    
    model_00 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][2]) * I(x3 - mean(x3))))
    expect_equal(round(means[5, 'value'], 3), get_coef(model_00, 1))
    
    model_p10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][2]) * I(x3 - mean(x3))))
    expect_equal(round(means[6, 'value'], 3), get_coef(model_p10, 1))
    
    
    model_m1p1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][3]) * I(x3 - mean(x3))))
    expect_equal(round(means[7, 'value'], 3), get_coef(model_m1p1, 1))
    
    model_0p1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][3]) * I(x3 - mean(x3))))
    expect_equal(round(means[8, 'value'], 3), get_coef(model_0p1, 1))
    
    model_p1p1 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][3]) * I(x3 - mean(x3))))
    expect_equal(round(means[9, 'value'], 3), get_coef(model_p1p1, 1))
})


test_that('collapsing over categorical variable works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    x3 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(456)
    y <- x1 * x2 * x3 + rnorm(100)
    
    x3 <- factor(x3)
    
    model <- lm(y ~ x1 * x2 * x3)
    means <- cell_means(model, x1, x2)
    
    pts <- list(
        x1=c(mean(x1) - sd(x1), mean(x1), mean(x1) + sd(x1)),
        x2=c(mean(x2) - sd(x2), mean(x2), mean(x2) + sd(x2))
    )
    
    model_m1m10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][1]) * x3))
    model_0m10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][1]) * x3))
    model_p1m10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][1]) * x3))
    
    model_m100 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][2]) * x3))
    model_000 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][2]) * x3))
    model_p100 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][2]) * x3))
    
    model_m1p10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][3]) * x3))
    model_0p10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][3]) * x3))
    model_p1p10 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][3]) * x3))
    
    contrasts(x3) <- c(1, 0)
    model_m1m11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][1]) * x3))
    model_0m11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][1]) * x3))
    model_p1m11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][1]) * x3))
    
    model_m101 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][2]) * x3))
    model_001 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][2]) * x3))
    model_p101 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][2]) * x3))
    
    model_m1p11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][1]) * I(x2 - pts[['x2']][3]) * x3))
    model_0p11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][2]) * I(x2 - pts[['x2']][3]) * x3))
    model_p1p11 <- summary(lm(
        y ~ I(x1 - pts[['x1']][3]) * I(x2 - pts[['x2']][3]) * x3))
    
    averages <- c(
        mean(c(get_coef(model_m1m10, 1, 6), get_coef(model_m1m11, 1, 6))),
        mean(c(get_coef(model_0m10, 1, 6), get_coef(model_0m11, 1, 6))),
        mean(c(get_coef(model_p1m10, 1, 6), get_coef(model_p1m11, 1, 6))),
        mean(c(get_coef(model_m100, 1, 6), get_coef(model_m101, 1, 6))),
        mean(c(get_coef(model_000, 1, 6), get_coef(model_001, 1, 6))),
        mean(c(get_coef(model_p100, 1, 6), get_coef(model_p101, 1, 6))),
        mean(c(get_coef(model_m1p10, 1, 6), get_coef(model_m1p11, 1, 6))),
        mean(c(get_coef(model_0p10, 1, 6), get_coef(model_0p11, 1, 6))),
        mean(c(get_coef(model_p1p10, 1, 6), get_coef(model_p1p11, 1, 6)))
    )
    
    expect_equal(round(means[1, 'value'], 3), round(averages[1], 3))
    expect_equal(round(means[2, 'value'], 3), round(averages[2], 3))
    expect_equal(round(means[3, 'value'], 3), round(averages[3], 3))
    
    expect_equal(round(means[4, 'value'], 3), round(averages[4], 3))
    expect_equal(round(means[5, 'value'], 3), round(averages[5], 3))
    expect_equal(round(means[6, 'value'], 3), round(averages[6], 3))
    
    expect_equal(round(means[7, 'value'], 3), round(averages[7], 3))
    expect_equal(round(means[8, 'value'], 3), round(averages[8], 3))
    expect_equal(round(means[9, 'value'], 3), round(averages[9], 3))
})


test_that('aov with 2-level predictor works', {
    x <- c(rep(0, 50), rep(1, 50))
    
    set.seed(234)
    y <- x + rnorm(100)
    x <- factor(x)
    
    model <- aov(y ~ x)
    means <- cell_means(model, x)
    table_means <- model.tables(model, type='means')$tables$x
    
    expect_equal(round(means[1, 'value'], 3), round(table_means[[1]], 3))
    expect_equal(round(means[2, 'value'], 3), round(table_means[[2]], 3))
})


test_that('binomial glm works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    rand <- rnorm(100)
    
    y <- as.numeric(x1 * x2 > mean(x1 * x2) & rand > mean(rand))
    
    data <- data.frame(x1, x2, y)
    
    model <- glm(y ~ x1 * x2, data, family='binomial')
    means <- cell_means(model, x1, x2, type='link')
    
    model_m1m1 <- summary(glm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I((x2 - mean(x2)) + sd(x2)),
        family='binomial'))
    expect_equal(round(means[1, 'value'], 3), get_coef(model_m1m1, 1))
    
    model_0m1 <- summary(glm(
        y ~ I(x1 - mean(x1)) * I((x2 - mean(x2)) + sd(x2)),
        family='binomial'))
    expect_equal(round(means[2, 'value'], 3), get_coef(model_0m1, 1))
    
    model_p1m1 <- summary(glm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I((x2 - mean(x2)) + sd(x2)),
        family='binomial'))
    expect_equal(round(means[3, 'value'], 3), get_coef(model_p1m1, 1))
    
    
    model_m10 <- summary(glm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I(x2 - mean(x2)),
        family='binomial'))
    expect_equal(round(means[4, 'value'], 3), get_coef(model_m10, 1))
    
    model_00 <- summary(glm(
        y ~ I(x1 - mean(x1)) * I(x2 - mean(x2)),
        family='binomial'))
    expect_equal(round(means[5, 'value'], 3), get_coef(model_00, 1))
    
    model_p10 <- summary(glm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I(x2 - mean(x2)),
        family='binomial'))
    expect_equal(round(means[6, 'value'], 3), get_coef(model_p10, 1))
    
    
    model_m1p1 <- summary(glm(
        y ~ I((x1 - mean(x1)) + sd(x1)) * I((x2 - mean(x2)) - sd(x2)),
        family='binomial'))
    expect_equal(round(means[7, 'value'], 3), get_coef(model_m1p1, 1))
    
    model_0p1 <- summary(glm(
        y ~ I(x1 - mean(x1)) * I((x2 - mean(x2)) - sd(x2)),
        family='binomial'))
    expect_equal(round(means[8, 'value'], 3), get_coef(model_0p1, 1))
    
    model_p1p1 <- summary(glm(
        y ~ I((x1 - mean(x1)) - sd(x1)) * I((x2 - mean(x2)) - sd(x2)),
        family='binomial'))
    expect_equal(round(means[9, 'value'], 3), get_coef(model_p1p1, 1))
})



