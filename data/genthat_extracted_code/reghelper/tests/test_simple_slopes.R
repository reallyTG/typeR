context('simple_slopes function')

library(nlme)
library(lme4)

# takes model and returns coefficient for a given variable/row number, rounded
# to 'digits' decimal places
get_coef <- function(model, row, digits=3) {
    return(round(coef(model)[row, 1], digits))
}
get_coef.lme <- function(model, row, digits=3) {
    return(round(model$tTable[row, 1], digits))
}


test_that('lm with 2 continuous int. works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    data <- data.frame(x1, x2, y)  # testthat doesn't seem to play nicely with
                                   # finding the variables in the parent
                                   # environment (with no data argument)
    
    model <- lm(y ~ x1 * x2, data)
    slopes <- simple_slopes(model)
    
    model_x1_m1 <- summary(lm(y ~ I((x1 - mean(x1)) + sd(x1)) * x2, data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
                 get_coef(model_x1_m1, 'x2'))
    
    model_x1_0 <- summary(lm(y ~ I(x1 - mean(x1)) * x2, data))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
                 get_coef(model_x1_0, 'x2'))
    
    model_x1_p1 <- summary(lm(y ~ I((x1 - mean(x1)) - sd(x1)) * x2, data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
                 get_coef(model_x1_p1, 'x2'))
    
    model_x2_m1 <- summary(lm(y ~ x1 * I((x2 - mean(x2)) + sd(x2)), data))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
                 get_coef(model_x2_m1, 'x1'))
    
    model_x2_0 <- summary(lm(y ~ x1 * I(x2 - mean(x2)), data))
    expect_equal(round(slopes[5, 'Test Estimate'], 3),
                 get_coef(model_x2_0, 'x1'))
    
    model_x2_p1 <- summary(lm(y ~ x1 * I((x2 - mean(x2)) - sd(x2)), data))
    expect_equal(round(slopes[6, 'Test Estimate'], 3),
                 get_coef(model_x2_p1, 'x1'))
})


test_that('lm with continuous x 2-level categorical int. works', {
    set.seed(123)
    x1 <- rnorm(100)

    x2 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(345)
    y <- x1 * x2 + rnorm(100)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    slopes <- simple_slopes(model)
    
    model_x1_m1 <- summary(lm(y ~ I((x1 - mean(x1)) + sd(x1)) * x2, data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
                 get_coef(model_x1_m1, 'x21'))
    
    model_x1_0 <- summary(lm(y ~ I(x1 - mean(x1)) * x2, data))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
                 get_coef(model_x1_0, 'x21'))
    
    model_x1_p1 <- summary(lm(y ~ I((x1 - mean(x1)) - sd(x1)) * x2, data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
                 get_coef(model_x1_p1, 'x21'))
    
    model_x2_0 <- summary(lm(y ~ x1 * x2, data))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
                 get_coef(model_x2_0, 'x1'))
    
    contrasts(data$x2) <- c(1, 0)
    model_x2_1 <- summary(lm(y ~ x1 * x2, data))
    expect_equal(round(slopes[5, 'Test Estimate'], 3),
                 get_coef(model_x2_1, 'x1'))
})


test_that('lm with continuous x 3-level categorical int. works', {
    set.seed(123)
    x1 <- rnorm(150)
    
    x2 <- c(rep(0, 50), rep(1, 50), rep(2, 50))
    
    set.seed(345)
    y <- x1 * x2 + rnorm(150)
    
    x2 <- factor(x2)
    
    data <- data.frame(x1, x2, y)
    
    model <- lm(y ~ x1 * x2, data)
    slopes <- simple_slopes(model)
    
    model_x1_m1 <- summary(lm(y ~ I((x1 - mean(x1)) + sd(x1)) * x2, data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
        get_coef(model_x1_m1, 'x21'))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
        get_coef(model_x1_m1, 'x22'))
    
    model_x1_0 <- summary(lm(y ~ I(x1 - mean(x1)) * x2, data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
        get_coef(model_x1_0, 'x21'))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
        get_coef(model_x1_0, 'x22'))
    
    model_x1_p1 <- summary(lm(y ~ I((x1 - mean(x1)) - sd(x1)) * x2, data))
    expect_equal(round(slopes[5, 'Test Estimate'], 3),
        get_coef(model_x1_p1, 'x21'))
    expect_equal(round(slopes[6, 'Test Estimate'], 3),
        get_coef(model_x1_p1, 'x22'))
    
    model_x2_0 <- summary(lm(y ~ x1 * x2, data))
    expect_equal(round(slopes[7, 'Test Estimate'], 3),
        get_coef(model_x2_0, 'x1'))
    
    contrasts(data$x2) <- matrix(c(1, 0, 0, 0, 0, 1), nrow=3)
    model_x2_1 <- summary(lm(y ~ x1 * x2, data))
    expect_equal(round(slopes[8, 'Test Estimate'], 3),
        get_coef(model_x2_1, 'x1'))
    
    contrasts(data$x2) <- matrix(c(1, 0, 0, 0, 1, 0), nrow=3)
    model_x2_1 <- summary(lm(y ~ x1 * x2, data))
    expect_equal(round(slopes[9, 'Test Estimate'], 3),
        get_coef(model_x2_1, 'x1'))
})


test_that('lm with 3 continuous int. works', {
    get_model <- function(data, points, test) {
        if (is.na(points[1])) {
            model <- lm(y ~ x1 * I(x2 - points[2]) * I(x3 - points[3]), data)
        } else if (is.na(points[2])) {
            model <- lm(y ~ I(x1 - points[1]) * x2 * I(x3 - points[3]), data)
        } else {
            model <- lm(y ~ I(x1 - points[1]) * I(x2 - points[2]) * x3, data)
        }
        return(get_coef(summary(model), test))
    }
    
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    x3 <- rnorm(100)
    
    set.seed(456)
    y <- x1 * x2 * x3 + rnorm(100)
    
    data <- data.frame(x1, x2, x3, y)
    
    model <- lm(y ~ x1 * x2 * x3, data)
    slopes <- simple_slopes(model)
    
    pts <- list(
        x1=c(mean(x1) - sd(x1), mean(x1), mean(x1) + sd(x1)),
        x2=c(mean(x2) - sd(x2), mean(x2), mean(x2) + sd(x2)),
        x3=c(mean(x3) - sd(x3), mean(x3), mean(x3) + sd(x3))
    )
    
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], pts[['x2']][1], NA), 'x3'))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], pts[['x2']][1], NA), 'x3'))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], pts[['x2']][1], NA), 'x3'))
    
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], pts[['x2']][2], NA), 'x3'))
    expect_equal(round(slopes[5, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], pts[['x2']][2], NA), 'x3'))
    expect_equal(round(slopes[6, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], pts[['x2']][2], NA), 'x3'))
    
    expect_equal(round(slopes[7, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], pts[['x2']][3], NA), 'x3'))
    expect_equal(round(slopes[8, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], pts[['x2']][3], NA), 'x3'))
    expect_equal(round(slopes[9, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], pts[['x2']][3], NA), 'x3'))
    
    expect_equal(round(slopes[10, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], NA, pts[['x3']][1]), 'x2'))
    expect_equal(round(slopes[11, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], NA, pts[['x3']][1]), 'x2'))
    expect_equal(round(slopes[12, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], NA, pts[['x3']][1]), 'x2'))
    
    expect_equal(round(slopes[13, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][1], pts[['x3']][1]), 'x1'))
    expect_equal(round(slopes[14, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][2], pts[['x3']][1]), 'x1'))
    expect_equal(round(slopes[15, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][3], pts[['x3']][1]), 'x1'))
    
    expect_equal(round(slopes[16, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], NA, pts[['x3']][2]), 'x2'))
    expect_equal(round(slopes[17, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], NA, pts[['x3']][2]), 'x2'))
    expect_equal(round(slopes[18, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], NA, pts[['x3']][2]), 'x2'))
    
    expect_equal(round(slopes[19, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][1], pts[['x3']][2]), 'x1'))
    expect_equal(round(slopes[20, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][2], pts[['x3']][2]), 'x1'))
    expect_equal(round(slopes[21, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][3], pts[['x3']][2]), 'x1'))
    
    expect_equal(round(slopes[22, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][1], NA, pts[['x3']][3]), 'x2'))
    expect_equal(round(slopes[23, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][2], NA, pts[['x3']][3]), 'x2'))
    expect_equal(round(slopes[24, 'Test Estimate'], 3),
        get_model(data, c(pts[['x1']][3], NA, pts[['x3']][3]), 'x2'))
    
    expect_equal(round(slopes[25, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][1], pts[['x3']][3]), 'x1'))
    expect_equal(round(slopes[26, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][2], pts[['x3']][3]), 'x1'))
    expect_equal(round(slopes[27, 'Test Estimate'], 3),
        get_model(data, c(NA, pts[['x2']][3], pts[['x3']][3]), 'x1'))
})


test_that('binomial glm with interaction works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    rand <- rnorm(100)
    
    y <- as.numeric((x1 > mean(x1) | x2 > mean(x2)) & rand > mean(rand))
    
    data <- data.frame(x1, x2, y)
    
    model <- glm(y ~ x1 * x2, family='binomial', data)
    slopes <- simple_slopes(model)
    
    model_x1_m1 <- summary(glm(y ~ I((x1 - mean(x1)) + sd(x1)) * x2,
        family='binomial', data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
        get_coef(model_x1_m1, 'x2'))
    
    model_x1_0 <- summary(glm(y ~ I(x1 - mean(x1)) * x2,
        family='binomial', data))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
        get_coef(model_x1_0, 'x2'))
    
    model_x1_p1 <- summary(glm(y ~ I((x1 - mean(x1)) - sd(x1)) * x2,
        family='binomial', data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
        get_coef(model_x1_p1, 'x2'))
    
    model_x2_m1 <- summary(glm(y ~ x1 * I((x2 - mean(x2)) + sd(x2)),
        family='binomial', data))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
        get_coef(model_x2_m1, 'x1'))
    
    model_x2_0 <- summary(glm(y ~ x1 * I(x2 - mean(x2)),
        family='binomial', data))
    expect_equal(round(slopes[5, 'Test Estimate'], 3),
        get_coef(model_x2_0, 'x1'))
    
    model_x2_p1 <- summary(glm(y ~ x1 * I((x2 - mean(x2)) - sd(x2)),
        family='binomial', data))
    expect_equal(round(slopes[6, 'Test Estimate'], 3),
        get_coef(model_x2_p1, 'x1'))
})


test_that('lme with interaction works', {
    set.seed(123)
    pre_treat <- rnorm(50)
    
    set.seed(234)
    post_treat <- 2 + rnorm(50)
    
    set.seed(345)
    pre_control <- rnorm(50)
    
    set.seed(456)
    post_control <- rnorm(50)
    
    dv <- c(pre_treat, post_treat, pre_control, post_control)
    
    pre_post <- factor(rep(c(rep(0, 50), rep(1, 50)), 2))
    condition <- factor(c(rep(0, 100), rep(1, 100)))
    id <- c(rep(1:50, 2), rep(51:100, 2))
    
    data <- data.frame(id, condition, pre_post, dv)
    
    model <- lme(dv ~ condition * pre_post, random=~1|id, data)
    slopes <- simple_slopes(model)
    

    contrasts(data$condition) <- c(0, 1)
    model_c_0 <- summary(lme(dv ~ condition * pre_post, random=~1|id, data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
        get_coef.lme(model_c_0, 'pre_post1'))
    
    contrasts(data$condition) <- c(1, 0)
    model_c_1 <- summary(lme(dv ~ condition * pre_post, random=~1|id, data))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
        get_coef.lme(model_c_1, 'pre_post1'))
    
    contrasts(data$condition) <- c(0, 1)  # revert to original contrast
    contrasts(data$pre_post) <- c(0, 1)
    model_p_0 <- summary(lme(dv ~ condition * pre_post, random=~1|id, data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
        get_coef.lme(model_p_0, 'condition1'))
    
    contrasts(data$pre_post) <- c(1, 0)
    model_p_1 <- summary(lme(dv ~ condition * pre_post, random=~1|id, data))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
        get_coef.lme(model_p_1, 'condition1'))
})


test_that('lmer with interaction works', {
    set.seed(123)
    pre_treat <- rnorm(50)
    
    set.seed(234)
    post_treat <- 2 + rnorm(50)
    
    set.seed(345)
    pre_control <- rnorm(50)
    
    set.seed(456)
    post_control <- rnorm(50)
    
    dv <- c(pre_treat, post_treat, pre_control, post_control)
    
    pre_post <- factor(rep(c(rep(0, 50), rep(1, 50)), 2))
    condition <- factor(c(rep(0, 100), rep(1, 100)))
    id <- c(rep(1:50, 2), rep(51:100, 2))
    
    data <- data.frame(id, condition, pre_post, dv)
    
    model <- lmer(dv ~ condition * pre_post + (1|id), data)
    slopes <- simple_slopes(model)
    
    
    contrasts(data$condition) <- c(0, 1)
    model_c_0 <- summary(lmer(dv ~ condition * pre_post + (1|id), data))
    expect_equal(round(slopes[1, 'Test Estimate'], 3),
        get_coef(model_c_0, 'pre_post1'))
    
    contrasts(data$condition) <- c(1, 0)
    model_c_1 <- summary(lmer(dv ~ condition * pre_post + (1|id), data))
    expect_equal(round(slopes[2, 'Test Estimate'], 3),
        get_coef(model_c_1, 'pre_post1'))
    
    contrasts(data$condition) <- c(0, 1)  # revert to original contrast
    contrasts(data$pre_post) <- c(0, 1)
    model_p_0 <- summary(lmer(dv ~ condition * pre_post + (1|id), data))
    expect_equal(round(slopes[3, 'Test Estimate'], 3),
        get_coef(model_p_0, 'condition1'))
    
    contrasts(data$pre_post) <- c(1, 0)
    model_p_1 <- summary(lmer(dv ~ condition * pre_post + (1|id), data))
    expect_equal(round(slopes[4, 'Test Estimate'], 3),
        get_coef(model_p_1, 'condition1'))
})



