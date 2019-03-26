context("cor_vector")

### New tests w/ cor_vector_ivn
test_that("cor_vector only accepts numeric values", {
    ### Integer OK
    m <- data.frame(matrix(c(1L, 2L, 3L, 5L), ncol = 2))
    expect_error(cor_vector_ivn(m, ivn = NULL), NA)
    expect_error(cor_vector_ivn(m, ivn = list(2, 1)), NA)

    ### Numeric OK
    m <- data.frame(matrix(c(1, 2, 3, 5), ncol = 2))
    expect_error(cor_vector_ivn(m, ivn = NULL), NA)
    expect_error(cor_vector_ivn(m, ivn = list(2, 1)), NA) ## outputs nonsense results but should still run!

    ### Character not OK
    m <- data.frame(list(int = c(1L, 2L), numeric = c(3, 5), char = c("abc", "abc")), stringsAsFactors = FALSE)
    expect_error(cor_vector_ivn(m, ivn = NULL), "must be numeric")
    expect_error(cor_vector_ivn(m, ivn = list(2, 1)), "must be numeric")

    ### Factor not OK
    m <- data.frame(list(int = c(1L, 2L), numeric = c(3, 5), char = c("abc", "abc")), stringsAsFactors = TRUE)
    expect_error(cor_vector_ivn(m, ivn = NULL), "must be numeric")
    expect_error(cor_vector_ivn(m, ivn = list(2, 1)), "must be numeric")
})

test_that("cor_vector_ivn treats NULL and list(NULL,...) the same", {
    dat <- generate_fixed_data_frame()
    ivn <- rep(list(NULL), ncol(dat)) # same as list(NULL, NULL, NULL, NULL, NULL)
    expect_equal(cor_vector_ivn(dat, ivn = NULL), cor_vector_ivn(dat, ivn = ivn))
})

test_that("check case when all cors = 1", {
    m <- data.frame(matrix(seq(1, by = 2, length.out = 12), ncol = 3))
    expect_equal(cor_vector_ivn(m, ivn = NULL)$cors, rep(1, 6))
})

test_that("cor_vector organizes values as expected", {
    m <- data.frame(matrix(runif(12), ncol = 3)) # random input here OK or no?
    expect_equivalent(cor_vector_ivn(m, ivn = NULL)$cors[4:6], cor(m)[3,])
})

test_that("cor_vector has at least ncol ones", {
    m <- data.frame(matrix(runif(80), ncol = 10)) # random input here OK or no?
    expect_true(sum(cor_vector_ivn(m, ivn = NULL)$cors == 1) >= 10)
})

test_that("cor_vector_ivn consistent with cor_vector for obs data",{
    m <- data.frame(matrix(runif(12), ncol = 3))
    expect_equal(suppressWarnings(cor_vector(m)), cor_vector_ivn(m, NULL)$cors)
})

### OLD TESTS (now deprecated)
# test_that("cor_vector only accepts numeric values", {
#     m <- data.frame(matrix(c(1L, 2L, 3L, 5L), ncol = 2))
#     expect_error(cor_vector(m), "must be numeric")
#
#     m <- data.frame(matrix(c(1, 2, 3, 5), ncol = 2))
#     expect_error(cor_vector(m), NA)
# })
#
# test_that("check case when all cors = 1", {
#     m <- data.frame(matrix(seq(1, by = 2, length.out = 12), ncol = 3))
#     expect_equal(cor_vector(m), rep(1, 6))
# })
#
# test_that("cor_vector organizes values as expected", {
#     m <- data.frame(matrix(runif(12), ncol = 3)) # random input here OK or no?
#     expect_equivalent(cor_vector(m)[4:6], cor(m)[3,])
# })
#
# test_that("cor_vector has at least ncol ones", {
#     m <- data.frame(matrix(runif(80), ncol = 10)) # random input here OK or no?
#     expect_true(sum(cor_vector(m) == 1) >= 10)
# })
