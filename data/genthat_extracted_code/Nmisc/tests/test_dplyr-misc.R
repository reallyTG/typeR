context("Testing dplyr-misc")

test_that("pull_with_names works", {
    result1 <- pull_with_names(iris, "Petal.Width", "Species")
    result2 <- pull_with_names(iris, 4, "Species")
    result3 <- pull_with_names(iris, Petal.Width, "Species")
    
    expected <- iris[["Petal.Width"]]
    names(expected) <- as.character(iris[["Species"]])
    
    expect_equal(result1, expected)
    expect_equal(result2, expected)
    expect_equal(result3, expected)
})


test_that("pull_with_names stops with NA", {
    expect_error(pull_with_names(iris, 4, NA))
})


test_that("pull_with_names stops with NULL", {
    expect_error(pull_with_names(iris, 4, NULL))
})


test_that("pull_with_names stops with name_col vector", {
    expect_error(pull_with_names(iris, 1, c("Species1", "Species2")))
})


test_that("pull_with_names stops with NA var", {
    expect_error(pull_with_names(iris, NA, "Species"))
})
