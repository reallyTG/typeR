context("test-utils")

test_that("if (a is not NULL) then a, else b", {
    expect_equal(NULL %||% 1, 1)
    expect_equal(NULL %||% -1, -1)
    expect_equal(1 %||% NULL, 1)
    expect_equal(-1 %||% NULL, -1)
    expect_equal(NULL %||% NULL, NULL)
    expect_equal(NULL %||% NULL %||% 1, 1)
    expect_equal("a" %||% NULL, "a")
    expect_equal(NULL %||% "a", "a")
    expect_equal(NA %||% 1, NA)
    expect_equal(FALSE %||% "a", FALSE)
    expect_equal("" %||% "a", "")
})

fact_a <- factor(LETTERS[1:5], levels = LETTERS)
fact_b <- factor(LETTERS[6:10], levels = LETTERS)
fact_c <- factor(c("A", "Z", "A", "Z", "A"), levels = LETTERS)

test_that("correctly assign numbers for factors", {
    expect_error(which_level(""))
    expect_error(which_level(1))
    expect_equal(which_level(c()), integer(0))
    expect_equal(which_level(fact_a), c(1:5))
    expect_equal(which_level(factor("A", levels = c("A"))), 1)
})

test_that("factor comparison works", {
    expect_error(factor_is_greater(c(1,2,3), c(1,2,3)))
    expect_error(factor_is_greater(c(1,2,3)))
    expect_true(all(factor_is_greater(fact_b, fact_a)))
    expect_false(all(factor_is_greater(fact_a, fact_b)))
    expect_warning(factor_is_greater(fact_a, fact_b[1:2]),
                   regexp = "longer object length")
    expect_equivalent(factor_is_greater(fact_b, fact_c),
                      c(TRUE, FALSE, TRUE, FALSE, TRUE))
    expect_false(factor_is_greater(factor("A", levels = LETTERS),
                                   factor("A", levels = LETTERS)))
})
