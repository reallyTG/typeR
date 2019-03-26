
context("Length of the list that is returned by the sglg() function.")

test_that("test if sglg() returns a list of length 34", {
    x3 <- as.data.frame(example_sglg$x3)
    colnames(x3) <- "x3"
    expect_length(sglg(y2 ~ x2 - 1, npc = x3, data = example_sglg), 34)
})

context("Testing messages that are returned by the sglg() function.")
test_that("test if sglg() returns warning messages.", {
    expect_error(sglg(npc = x3, data = example_sglg), "The formula argument is missing.")
    expect_error(sglg(y2 ~ x2 - 1, npc = x3), "The data argument is missing.")
    expect_error(sglg(y2 ~ x2 - 1, data = example_sglg), "This kind of model need at least one non-parametric component.")
})
