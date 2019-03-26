library(quadprogXT)

N <- 10
set.seed(2)
cr <- matrix(runif(N * N, 0, .05), N, N)
diag(cr) <- 1
cr <- (cr + t(cr)) / 2
set.seed(3)
sigs <- runif(N, min = .02, max = .25)
set.seed(5)

dvec <- runif(N, -.1, .1)
Dmat <- sigs %o% sigs * cr
Amat <- cbind(diag(N), diag(N) * -1)
bvec <- c(rep(-1, N), rep(-1, N))

#solveQPXT(Dmat, dvec, Amat, bvec)

resBase <- solveQPXT(Dmat, dvec, Amat, bvec)

test_that("call with factorized fails", {
    expect_error(solveQPXT(Dmat, dvec, Amat, bvec, factorized = TRUE))
})

test_that("QPXT returns expected results for sum of absolute values <= 1 example", {
    res <- solveQPXT(Dmat, dvec, Amat, bvec, AmatPosNeg = matrix(rep(-1, 2 * N)), bvecPosNeg = -1)
    expect_true(sum(abs(res$solution[1:N])) <= 1 + 1e-10)
})

test_that("QPXT still handles case where dvecPosNeg is not null (L1 norm penalty)", {
    resL1Penalty <- solveQPXT(Dmat, dvec, Amat, bvec, dvecPosNeg = -.005 * rep(1, 2 * N))
    expect_true(sum(abs(resL1Penalty$solution[1:N]))  < sum(abs(resBase$solution)))
})

test_that("QPXT handles absolute changes in decision variable", {
    b0 <- rep(.15, N)
    thresh <- .25
    res <- solveQPXT(Dmat, dvec, Amat, bvec, b0 = b0,
                      AmatPosNegDelta = matrix(rep(-1, 2 * N)), bvecPosNegDelta = -thresh)
    expect_true(sum(abs(res$solution[1:N] - b0)) <= thresh + 1e-10)
})

test_that("QPXT allows a null Amat IF other constraints are passed", {
    res <- solveQPXT(Dmat, dvec, Amat = NULL, bvec = NULL, AmatPosNeg = matrix(rep(-1, 2 * N)), bvecPosNeg = -1)
    expect_true(sum(abs(res$solution[1:N])) <= 1 + 1e-10)
})

test_that("QPXT works with full problem size", {
    res <- try(solveQPXT(
        Dmat,
        dvec,
        Amat = Amat,
        bvec = bvec,
        AmatPosNeg = matrix(rep(-1, 2 * N)),
        bvecPosNeg = -1,
        AmatPosNegDelta = matrix(rep(-1, 2 * N)),
        bvecPosNegDelta = -.25,
        b0 = rep(.08, N)
    ))
    expect_false(inherits(res, "try-error"))
})

test_that("QPXT works with full problem size & specified dvecs", {
    res <- try(solveQPXT(
        Dmat,
        dvec,
        Amat = Amat,
        bvec = bvec,
        AmatPosNeg = matrix(rep(-1, 2 * N)),
        bvecPosNeg = -1,
        AmatPosNegDelta = matrix(rep(-1, 2 * N)),
        bvecPosNegDelta = -.25,
        dvecPosNeg = rep(-.005, 2 * N),
        dvecPosNegDelta = rep(-.0005, 2 * N),
        b0 = rep(.08, N)
    ))
    expect_false(inherits(res, "try-error"))
})
