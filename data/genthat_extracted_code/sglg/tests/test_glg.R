
context("Length of the list that is returned by the glg() function.")

test_that("test if glg() returns a list of length 29", {
    expect_length(glg(y1 ~ x1 + x2, data = example_sglg), 29)
})

context("Messages are returned by the glg() function.")

test_that("test if glg() returns warning messages.", {
    expect_error(glg(data = example_sglg), "The formula argument is missing.")
    expect_error(glg(y1 ~ x1 + x2), "The data argument is missing.")
})
