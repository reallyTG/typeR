context("generics")

dat <- data.frame(y = runif(20), x = replicate(2, runif(20)))
fit <- vinereg(y ~ ., dat, order = paste0("x.", 1:2))
fit_uscale <- vinereg(y ~ ., dat, uscale = TRUE, order = paste0("x.", 1:2))

test_that("print() works", {
    expect_output(test <- print(fit))
    expect_equal(test, fit)
    expect_output(print(fit_uscale))
})

test_that("summary() works", {
    expect_silent(smr <- summary(fit))
    expect_silent(smr_uscale <- summary(fit_uscale))

    smr_vars <- c("var", "edf", "cll", "caic", "cbic", "p_value")
    expect_equal(colnames(smr), smr_vars)
    expect_equal(colnames(smr_uscale), smr_vars)
    expect_equal(nrow(smr), 3)
    expect_equal(nrow(smr_uscale),  3)
    expect_equal(unname(unlist(smr_uscale[1, -1])), c(rep(0, 4), NA))
})


test_that("plot_effects()", {
    expect_s3_class(plot_effects(fit, NA), "gg")
    expect_warning(plot_effects(fit_uscale))
    expect_error(plot_effects(fit, vars = "asdf"))
})

