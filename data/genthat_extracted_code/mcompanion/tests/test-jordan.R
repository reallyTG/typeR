test_that("class JordanDecomposition is ok", {
    m <- matrix(c(1, 0, 1, 1), ncol = 2)
    jdtmp <- new("JordanDecompositionDefault", values = 0, heights = 2, vectors = m)
    expect_equal_to_reference( jdtmp, "jd01")

    m <- matrix(c(1, 0.5, 1, 1), ncol=2)
    expect_equal_to_reference(
        new("JordanDecompositionDefault", values = 0, height = 2, vectors = m), "jd02")

    mi <- matrix(c(1i, 0.5, 1, 1), nrow = 2)
    jd2 <- new("JordanDecompositionDefault", values = c(1i,0), heights=c(1,1), vectors = mi)
    expect_equal_to_reference( jd2, "jdi01")
})


test_that('new("JordanDecompositionDefault",...) is ok', {

    jd <- new("JordanDecompositionDefault")

    ## These should work but do not necessarily produce valid objects,
    ## use JordanDecomposition() for that.
    new("JordanDecompositionDefault")
                                        # "the number of vectors must equal sum(heights)"
    expect_error(new("JordanDecompositionDefault", values = c(1,2)))
    expect_error(new("JordanDecompositionDefault", heights = c(1L,1L)))
    expect_error(new("JordanDecompositionDefault", heights = c(1,1)))

    ## error
    expect_error(new("JordanDecompositionDefault", vectors = c(1,2)),
                 'invalid object for slot "vectors"')

    f <- function(values, vectors, heights){
        new("JordanDecompositionDefault", values = values, vectors = vectors,
                                          heights = heights)
    }

    f(values = 0, vectors = matrix(c(1, 0, 1, 1),    ncol = 2), heights = 2)
    f(values = 0, vectors = matrix(c(1, 0.5, 1, 1),  ncol = 2), heights = 2)
    f(values = 0, vectors = matrix(c(1i, 0.5, 1, 1), nrow = 2), heights = 2)

    f(values = rep(0,2), vectors = matrix(c(1, 0, 1, 1),    ncol = 2), heights = c(1, 1))
    f(values = rep(0,2), vectors = matrix(c(1, 0.5, 1, 1),  ncol = 2), heights = c(1, 1))
    f(values = rep(0,2), vectors = matrix(c(1i, 0.5, 1, 1), nrow = 2), heights = c(1, 1))
})

test_that("JordanDecomposition() is equivalent to new()", {
    f <- function(values, vectors, heights){
        jdA <- new("JordanDecompositionDefault", values = values, vectors = vectors,
                                                                  heights = heights)
        jdB <- JordanDecomposition(values = values, vectors = vectors, heights = heights)
        expect_identical(jdA, jdB)
    }

    f(values = 0, vectors = matrix(c(1, 0, 1, 1),    ncol = 2), heights = 2)
    f(values = 0, vectors = matrix(c(1, 0.5, 1, 1),  ncol = 2), heights = 2)
    f(values = 0, vectors = matrix(c(1i, 0.5, 1, 1), nrow = 2), heights = 2)

    f(values = rep(0,2), vectors = matrix(c(1, 0, 1, 1),    ncol = 2), heights = c(1, 1))
    f(values = rep(0,2), vectors = matrix(c(1, 0.5, 1, 1),  ncol = 2), heights = c(1, 1))
    f(values = rep(0,2), vectors = matrix(c(1i, 0.5, 1, 1), nrow = 2), heights = c(1, 1))
})


test_that("JordanDecomposition() works with missing heights", {
    f <- function(values, vectors){
        heights <- rep(1L, length(values))
        jdA <- JordanDecomposition(values = values, vectors = vectors, heights = heights)
        jdB <- JordanDecomposition(values = values, vectors = vectors)
        expect_identical(jdA, jdB)
    }

    f(values = rep(0,2), vectors = matrix(c(1, 0, 1, 1),    ncol = 2))
    f(values = rep(0,2), vectors = matrix(c(1, 0.5, 1, 1),  ncol = 2))
    f(values = rep(0,2), vectors = matrix(c(1i, 0.5, 1, 1), nrow = 2))
})

test_that("JordanDecomposition() methods with missing 'values' work", {
    m <- matrix(c(1, 0, 1, 1), ncol = 2)
    jd <- JordanDecomposition(vectors = m)
    expect_true(all(is.na(jd@values)))

})


test_that("JordanDecomposition() with missing 'vectors' is ok", {
    f <- function(values, heights){
        jd <- JordanDecomposition(values = values, heights = heights)
    }

    f(values = 0, heights = 2)
    f(values = rep(0,2), heights = c(1, 1))
})



test_that("JordanDecomposition() method for 'list' works", {
    m <- matrix(c(1, 0, 1, 1), ncol = 2)

    ## list with names as the slots
    ev1 <- list(values = rep(0,2), vectors = m, heights = c(1, 1))

    ## list with other names - specify the correspondence with argument 'names'
    ev2 <- list(eigval = rep(0,2), eigvec = m, len.block = c(1, 1))
    names2 <- c(values = "eigval", vectors = "eigvec", heights = "len.block")

    expect_identical(JordanDecomposition(values = ev1),
                     JordanDecomposition(values = ev2, names = names2))

})


test_that("JordanDecomposition() returns 'values' if values is 'JordanDecomposition'", {
    m <- matrix(c(1, 0, 1, 1), ncol = 2)
    jd <- new("JordanDecompositionDefault", values = 0, heights = 2, vectors = m)
    expect_identical(JordanDecomposition(jd), jd)
})







