context("Gaines and Kuklinski examples")

test_that("Results match AJPS (2011)", {
    data(ajps)
    e <- with(ajps, estimate(rand = tr %in% 1:2, tr = tr %in% c(1,3), y = therm.obama, iterations = 100))
    expect_true(is.data.frame(e), label = "data.frame returned")
    expect_true(identical(dim(e), c(4L, 5L)), label = "data.frame dims correct")
    expect_true(identical(names(e), c("Effect", "Estimate", "SE", "t", "p")), label = "data.frame names correct")
    expect_true(length(attributes(e)$means) == 5, label = "treatment group means returned")
    expect_true(length(attributes(e)$alpha) == 1, label = "alpha returned")
})
