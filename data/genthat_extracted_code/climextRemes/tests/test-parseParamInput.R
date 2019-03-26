require(testthat)

context("Testing parseParamInput().")

testFormula <- ~x1+x5
test_that(paste0("test parseParamInput() with formula input"), {
    expect_equal(parseParamInput(~x1 + x5),
                testFormula)
})
test_that(paste0("test parseParamInput() with NULL input"), {
    expect_equal(parseParamInput(NULL),
                ~1)
})
test_that(paste0("test parseParamInput() with non-integer input"), {
    expect_error(parseParamInput(c(1.7,3), paste0('x', 1:5)))
})
test_that(paste0("test parseParamInput() with integer input"), {
    expect_equal(parseParamInput(c(1,5), paste0('x', 1:5)),
                testFormula)
})
test_that(paste0("test parseParamInput() with character input"), {
    expect_equal(parseParamInput(c("x1","x5")),
                testFormula)
})
test_that(paste0("test parseParamInput() with erroneous input"), {
    expect_error(parseParamInput(list(5, "x")))
})
