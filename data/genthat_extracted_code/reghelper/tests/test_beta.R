context('beta function')

library(nlme)
library(lme4)

# takes model and returns coefficient for a given variable/row number, rounded
# to 'digits' decimal places
get_coef <- function(model, row, digits=3) {
    return(round(coef(model)[row, 1], digits))
}

# takes model and returns variable names
get_var_names <- function(model) {
    return(attr(attr(terms(model), 'dataClasses'), 'names'))
}


test_that('lm with continuous predictor works', {
    set.seed(123)
    x <- rnorm(100)
    
    set.seed(234)
    y <- x + rnorm(100)
    
    model <- lm(y ~ x)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    expect_equal(get_coef(beta_model, 'x.z'), 0.744)
    expect_equal(coef(beta_model)[2, 4], coef(summary(model))[2, 4])
        # p-values should still match
})


test_that('lm with 2-level categorical predictor works', {
    x <- c(rep(0, 50), rep(1, 50))
    
    set.seed(234)
    y <- x + rnorm(100)
    x <- factor(x)
    
    model <- lm(y ~ x)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x1.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    expect_equal(get_coef(beta_model, 'x1.z'), 0.528)
    expect_equal(coef(beta_model)[2, 4], coef(summary(model))[2, 4])
        # p-values should still match
})


test_that('lm with 3-level categorical predictor works', {
    x <- c(rep(0, 50), rep(1, 50), rep(2, 50))
    
    set.seed(234)
    y <- x + rnorm(150)
    x <- factor(x)
    
    model <- lm(y ~ x)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x1.z', 'x2.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    # check coefficients
    expect_equal(get_coef(beta_model, 'x1.z'), 0.450)
    expect_equal(get_coef(beta_model, 'x2.z'), 0.722)
    
    # p-values should still match
    expect_equal(coef(beta_model)[2, 4], coef(summary(model))[2, 4])
    expect_equal(coef(beta_model)[3, 4], coef(summary(model))[3, 4])
})


test_that('lm with 2-level categorical x continuous interaction works', {
    x1 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(123)
    x2 <- rnorm(100)
    
    set.seed(234)
    y <- x1 * x2 + rnorm(100)
    x1 <- factor(x1)
    
    model <- lm(y ~ x1 * x2)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x11.z', 'x2.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    # check coefficients
    expect_equal(get_coef(beta_model, 'x11.z'), 0.090)
    expect_equal(get_coef(beta_model, 'x2.z'), 0.470)
    expect_equal(get_coef(beta_model, 'x11.z:x2.z'), 0.441)
    
    # main effect p-values may differ, but interaction p should still match
    expect_equal(coef(beta_model)[4, 4], coef(summary(model))[4, 4])
})


test_that('lm with 3-level categorical x continuous interaction works', {
    x1 <- c(rep(0, 50), rep(1, 50), rep(2, 50))
    
    set.seed(123)
    x2 <- rnorm(150)
    
    set.seed(234)
    y <- x1 * x2 + rnorm(150)
    x1 <- factor(x1)
    
    model <- lm(y ~ x1 * x2)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x11.z', 'x12.z', 'x2.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    # check coefficients
    expect_equal(get_coef(beta_model, 'x11.z'), 0.022)
    expect_equal(get_coef(beta_model, 'x12.z'), -0.050)
    expect_equal(get_coef(beta_model, 'x2.z'), 0.633)
    expect_equal(get_coef(beta_model, 'x11.z:x2.z'), 0.300)
    expect_equal(get_coef(beta_model, 'x12.z:x2.z'), 0.567)
    
    # main effect p-values may differ, but interaction ps should still match
    expect_equal(coef(beta_model)[5, 4], coef(summary(model))[5, 4])
    expect_equal(coef(beta_model)[6, 4], coef(summary(model))[6, 4])
})


test_that('lm with three-way interaction works', {
    x1 <- c(rep(0, 50), rep(1, 50))
    
    set.seed(123)
    x2 <- rnorm(100)
    
    set.seed(234)
    x3 <- rnorm(100)
    
    set.seed(345)
    y <- x1 * x2 * x3 + rnorm(100)
    x1 <- factor(x1)
    
    model <- lm(y ~ x1 * x2 * x3)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x11.z', 'x2.z', 'x3.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    # check coefficients
    expect_equal(get_coef(beta_model, 'x11.z'), -0.064)
    expect_equal(get_coef(beta_model, 'x2.z'), -0.099)
    expect_equal(get_coef(beta_model, 'x3.z'), -0.155)
    expect_equal(get_coef(beta_model, 'x11.z:x2.z'), 0.126)
    expect_equal(get_coef(beta_model, 'x11.z:x3.z'), 0.044)
    expect_equal(get_coef(beta_model, 'x2.z:x3.z'), 0.439)
    expect_equal(get_coef(beta_model, 'x11.z:x2.z:x3.z'), 0.393)
    
    # main effect p-values may differ, but interaction p should still match
    expect_equal(coef(beta_model)[8, 4], coef(summary(model))[8, 4])
})


test_that('skipping over variables works', {
    set.seed(123)
    x1 <- rnorm(100)
    
    set.seed(234)
    x2 <- rnorm(100)
    
    set.seed(345)
    y <- x1 + x2 + rnorm(100)
    
    model <- lm(y ~ x1 + x2)
    
    beta_model1 <- beta(model, y=FALSE)
    expect_equal(get_var_names(beta_model1), c('y', 'x1.z', 'x2.z'))
    
    beta_model2 <- beta(model, x=FALSE)
    expect_equal(get_var_names(beta_model2), c('y.z', 'x1', 'x2'))
    
    beta_model3 <- beta(model, x=FALSE, y=FALSE)
    expect_equal(get_var_names(beta_model3), c('y', 'x1', 'x2'))
    
    beta_model4 <- beta(model, skip='x1')
    expect_equal(get_var_names(beta_model4), c('y.z', 'x1', 'x2.z'))
    
    beta_model5 <- beta(model, skip='x2')
    expect_equal(get_var_names(beta_model5), c('y.z', 'x1.z', 'x2'))
    
    beta_model6 <- beta(model, skip=c('x1', 'x2'))
    expect_equal(get_var_names(beta_model6), c('y.z', 'x1', 'x2'))
    
    beta_model7 <- beta(model, skip=c('y', 'x1', 'x2'))
    expect_equal(get_var_names(beta_model7), c('y', 'x1', 'x2'))
})


test_that('aov with 2-level predictor works', {
    x <- c(rep(0, 50), rep(1, 50))
    
    set.seed(234)
    y <- x + rnorm(100)
    x <- factor(x)
    
    model <- aov(y ~ x)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x1.z'))
    
    sum_sq <- summary(model)[[1]][['Sum Sq']]
    r_sq <- 1 - sum_sq[2] / (sum_sq[1] + sum_sq[2])
    
    expect_equal(beta_model$r.squared, r_sq)
    
    expect_equal(get_coef(beta_model, 'x1.z'), 0.528)
    expect_equal(coef(beta_model)[2, 4], summary(model)[[1]][1, 'Pr(>F)'])
        # p-values should still match
})


test_that('aov with 3-level predictor works', {
    x <- c(rep(0, 50), rep(1, 50), rep(2, 50))
    
    set.seed(234)
    y <- x + rnorm(150)
    x <- factor(x)
    
    model <- aov(y ~ x)
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y.z', 'x1.z', 'x2.z'))
    
    sum_sq <- summary(model)[[1]][['Sum Sq']]
    r_sq <- 1 - sum_sq[2] / (sum_sq[1] + sum_sq[2])
    
    expect_equal(beta_model$r.squared, r_sq)
    
    expect_equal(get_coef(beta_model, 'x1.z'), 0.450)
    expect_equal(get_coef(beta_model, 'x2.z'), 0.722)
})


test_that('binomial glm with continuous predictor works', {
    set.seed(123)
    x <- rnorm(100)
    
    set.seed(234)
    rand <- rnorm(100)
    
    y <- as.numeric(x > mean(x) & rand > mean(rand))
    
    model <- glm(y ~ x, family='binomial')
    beta_model <- beta(model)
    
    expect_equal(get_var_names(beta_model), c('y', 'x.z'))
    
    expect_equal(beta_model$r.squared, summary(model)$r.squared)
    
    expect_equal(get_coef(beta_model, 'x.z'), 1.822)
    expect_equal(coef(beta_model)[2, 4], coef(summary(model))[2, 4])
        # p-values should still match
})


test_that('lme with continuous and categorical predictors works', {
    set.seed(123)
    pre_dv <- rnorm(50)
    
    set.seed(234)
    post_dv <- 2 + rnorm(50)
    
    dv <- c(pre_dv, post_dv)
    
    set.seed(345)
    pred <- .3 * dv + rnorm(50)
    
    pre_post <- factor(c(rep(0, 50), rep(1, 50)))
    id <- rep(1:50, 2)
    
    data <- data.frame(id, pre_post, pred, dv)
    
    model <- lme(dv ~ pre_post * pred, random=~1|id, data)
    beta_model <- beta(model, skip='pre_post')
    
    expect_equal(attr(attr(beta_model$terms, 'dataClasses'), 'names'),
        c('dv.z', 'pre_post', 'pred.z'))
    
    expect_equal(beta_model$tTable[2, 5], summary(model)$tTable[2, 5])
    expect_equal(beta_model$tTable[3, 5], summary(model)$tTable[3, 5])
    expect_equal(beta_model$tTable[4, 5], summary(model)$tTable[4, 5])
        # p-values should still match
})


test_that('lmer with continuous and categorical predictors works', {
    set.seed(123)
    pre_dv <- rnorm(50)
    
    set.seed(234)
    post_dv <- 2 + rnorm(50)
    
    dv <- c(pre_dv, post_dv)
    
    set.seed(345)
    pred <- .3 * dv + rnorm(50)
    
    pre_post <- factor(c(rep(0, 50), rep(1, 50)))
    id <- rep(1:50, 2)
    
    data <- data.frame(id, pre_post, pred, dv)
    
    model <- lmer(dv ~ pre_post * pred + (1|id), data)
    beta_model <- beta(model, skip='pre_post')
    
    expect_equal(rownames(coef(beta_model)),
        c('(Intercept)', 'pre_post1', 'pred.z', 'pre_post1:pred.z'))
    expect_equal(names(beta_model$ngrps), 'id')
    
    expect_equal(beta_model$tTable[2, 5], summary(model)$tTable[2, 5])
    expect_equal(beta_model$tTable[3, 5], summary(model)$tTable[3, 5])
    expect_equal(beta_model$tTable[4, 5], summary(model)$tTable[4, 5])
        # p-values should still match
})





