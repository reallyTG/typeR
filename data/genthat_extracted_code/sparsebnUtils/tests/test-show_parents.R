context("show.parents")

sbp <- generate_nontrivial_sparsebnPath()

test_that("show.parents runs without error with valid input", {
    expect_error(suppressFunctionOutput(show.parents(sbp[[1]], "xyz")), NA)
    expect_error(suppressFunctionOutput(show.parents(sbp[[2]], c("xyz", "abc"))), NA)

    ### Duplicates are OK
    expect_error(suppressFunctionOutput(show.parents(sbp[[3]], c("xyz", "abc", "123", "xyz"))), NA)
})

test_that("show.parents successfully uses partial matching", {
    expect_error(suppressFunctionOutput(show.parents(sbp[[3]], c("x", "a1", "hi"))), NA)
})

test_that("show.parents handles no match", {
    expect_error(show.parents(sbp[[1]], "A"), "named A found!") # 'node(s)' in the error message seems to cause problems with expect_error
    expect_error(show.parents(sbp[[2]], c("A", "B")), "named A, B found!")
})
