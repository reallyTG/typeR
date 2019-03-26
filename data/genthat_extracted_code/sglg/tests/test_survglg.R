
context("Length of the list that is returned by the survglg() function.")

test_that("test if survglg() returns a list of length 31", {
    expect_length(survglg(Surv(log(obst1), delta1) ~ x1 + x2 - 1, data = example_sglg,
        shape = 1), 31)
})

context("Messages are returned by the survglg() function.")

test_that("test if survglg() returns warning messages.", {
    expect_error(survglg(data = example_sglg), "The formula argument is missing.")
    expect_error(survglg(Surv(log(obst1), delta1) ~ x1 + x2 - 1), "The data argument is missing.")
})
