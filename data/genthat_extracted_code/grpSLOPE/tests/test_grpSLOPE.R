library(grpSLOPE)

A.vec <- c(0.26, 0.37,0.57, 0.90, 0.20, 0.89, 0.94, 0.66, 0.62,0.06)
eps   <- c(-0.7473417,-0.8858673,-0.9273622,-0.7895264,0.7119688,-0.8379027,
           -0.3327135,1.0339414,-1.2187906,-0.8921233)
A   <- diag(A.vec)
grp <- c(0, 0, 1, 1, 2, 2, 2, 2, 2, 3)
b   <- c(0, 0, 50, 10, 0, 0, 0, 10, 0, 30)
y   <- A %*% b + eps
fdr <- 0.1

#--------------------------------------------------------------------------
context("grpSLOPE(lambda = 'corrected')")

sol.c <- c(0, 0, 17.022493, 4.901825, 0, 0, 0, 0, 0, 0)
sol.beta <- c(0, 0, 17.570533, 4.932366, 0, 0, 0, 0, 0, 0)
sol.group.norms <- c(0, 17.71421, 0, 0)
sol.beta.original.scale <- c(0, 0, 32.492927, 5.776856, 0, 0, 0, 0, 0, 0)
sol.intercept <- 1.729414

test_that("when the groups are consecutive blocks", {
  result <- grpSLOPE(X=A, y=y, group=grp, fdr=fdr, lambda="corrected")
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.c, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("when the groups are not consecutive blocks", {
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="corrected")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp[ord])
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with non-zero intercept", {
  y   <- y + 100
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="corrected")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp[ord])
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 101.7294145, tolerance=1e-5)
})

test_that("corrected lambdas can't be computed unless groups sizes are small enough compared to sample size", {
  M <- cbind(A, matrix(1:30, 10, 3))
  bm <- c(b, 0, 100, 1000)
  grp.M <- c(rep(1, 11), 2, 2)
  y <- M %*% bm + eps
  expect_error(grpSLOPE(X=M, y=y, group=grp.M, fdr=fdr, lambda="corrected"),
               regexp = "Corrected lambdas cannot be computed unless groups sizes are small enough compared to sample size.")
})

test_that("an error message is returned when inputs have missing data", {
  # NA in X
  Xcorrupted <- A
  ind1 <- sample(1:nrow(Xcorrupted), 3)
  ind2 <- sample(1:ncol(Xcorrupted), 2)
  Xcorrupted[ind1, ind2] <- NA
  expect_error(grpSLOPE(X=Xcorrupted, y=y, group=grp, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of X are NA or NaN!")
  # NaN in X
  Xcorrupted <- A
  ind1 <- sample(1:nrow(Xcorrupted), 3)
  ind2 <- sample(1:ncol(Xcorrupted), 2)
  Xcorrupted[ind1, ind2] <- NaN 
  expect_error(grpSLOPE(X=Xcorrupted, y=y, group=grp, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of X are NA or NaN!")
  # NA in y
  ycorrupted <- y
  ind1 <- sample(1:length(y), 1)
  ycorrupted[ind1] <- NA
  expect_error(grpSLOPE(X=A, y=ycorrupted, group=grp, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of y are NA or NaN!")
  # NaN in y
  ycorrupted <- y
  ind1 <- sample(1:length(y), 3)
  ycorrupted[ind1] <- NaN 
  expect_error(grpSLOPE(X=A, y=ycorrupted, group=grp, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of y are NA or NaN!")
  # NA in group 
  grpcorrupted <- grp 
  ind1 <- sample(1:length(grp), 1)
  grpcorrupted[ind1] <- NA
  expect_error(grpSLOPE(X=A, y=y, group=grpcorrupted, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of group are NA or NaN!")
  # NaN in group 
  grpcorrupted <- grp
  ind1 <- sample(1:length(grp), 3)
  grpcorrupted[ind1] <- NaN 
  expect_error(grpSLOPE(X=A, y=y, group=grpcorrupted, fdr=fdr, lambda="corrected"),
               regexp = "Some entries of group are NA or NaN!")
})

test_that("an error message is returned when X has constant columns and normalize=TRUE", {
  # NA in X
  Xcorrupted <- A
  ind1 <- sample(1:nrow(Xcorrupted), 1)
  Xcorrupted[ , ind1] <- rep(rnorm(1), nrow(Xcorrupted)) 
  expect_error(grpSLOPE(X=Xcorrupted, y=y, group=grp, fdr=fdr, lambda="corrected", normalize=TRUE),
               regexp = "X cannot be normalized (probably some column has sample variance equal to 0).", fixed=TRUE)
})

#--------------------------------------------------------------------------
context("grpSLOPE(lambda = 'corrected', orthogonalize = FALSE)")

# not sure why results slightly differ from the case when orthogonalize=TRUE...
# at least the results agree between orthogonalize=TRUE/FALSE in the example below, where normalize=FALSE...
sol.beta <- c(0, 0, 17.427106, 4.330629, 0, 0, 0, 0, 0, 0)
sol.group.norms <- c(0, 17.48391, 0, 0)
sol.beta.original.scale <- c(0, 0, 32.227690, 5.072093, 0, 0, 0, 0, 0, 0)
sol.intercept <- 1.807962

test_that("when the groups are consecutive blocks", {
  result <- grpSLOPE(X=A, y=y, group=grp, fdr=fdr, lambda="corrected", orthogonalize = FALSE)
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.beta, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp)
  expect_identical(result$group.c, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("when the groups are not consecutive blocks", {
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="corrected", orthogonalize = FALSE)
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(result$c, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp[ord])
  expect_identical(result$group.c, grp[ord])
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with non-zero intercept", {
  y <- y + 200
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="corrected", orthogonalize = FALSE)
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(result$c, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp[ord])
  expect_identical(result$group.c, grp[ord])
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 201.8079616, tolerance=1e-5)
})

test_that("when rank of group submatrix is smaller than the group size", {
  B <- A
  B[ , 5] <- B[ , 6] <- B[ , 7]
  y <- B %*% b + eps

  result <- grpSLOPE(X=B, y=y, group=grp, fdr=fdr, lambda="corrected", orthogonalize = FALSE)
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.beta, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp)
  expect_identical(result$group.c, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("corrected lambdas can't be computed unless groups sizes are small enough compared to sample size", {
  M <- cbind(A, matrix(1:30, 10, 3))
  bm <- c(b, 0, 100, 1000)
  grp.M <- c(rep(1, 11), 2, 2)
  y <- M %*% bm + eps
  expect_error(grpSLOPE(X=M, y=y, group=grp.M, fdr=fdr, lambda="corrected", orthogonalize = FALSE),
               regexp = "Corrected lambdas cannot be computed unless groups sizes are small enough compared to sample size.")
})

#--------------------------------------------------------------------------
context("grpSLOPE(lambda = 'corrected', orthogonalize = FALSE, normalize = FALSE)")

N <- diag(rep(1, 10))
z <- N %*% b + eps
sol.beta <- c(0, 0,37.621344, 7.061173, 0, 0, 0, 0, 0, 20.869200)
sol.group.norms <- c(0, 38.27827, 0, 20.869200)

test_that("when the groups are consecutive blocks", {
  result <- grpSLOPE(X=N, y=z, group=grp, fdr=fdr, lambda="corrected",
                     orthogonalize = FALSE, normalize = FALSE)
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.beta, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1, 3))
  expect_identical(result$group, grp)
  expect_identical(result$group.c, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 0, tolerance=1e-5)
})

test_that("with orthogonalize = TRUE it gives the same result", {
  result <- grpSLOPE(X=N, y=z, group=grp, fdr=fdr, lambda="corrected",
                     orthogonalize = TRUE, normalize = FALSE)
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1, 3))
  expect_identical(result$group, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 0, tolerance=1e-5)
})

test_that("when the groups are not consecutive blocks", {
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=N[ , ord], y=z, group=grp[ord], fdr=fdr, lambda="corrected",
                     orthogonalize = FALSE, normalize = FALSE)
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(result$c, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_identical(sort(as.numeric(result$selected)), c(1, 3))
  expect_identical(result$group, grp[ord])
  expect_identical(result$group.c, grp[ord])
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 0, tolerance=1e-5)
})

test_that("when rank of group submatrix is smaller than the group size", {
  B <- N
  B[ , 5] <- B[ , 6] <- B[ , 7]
  z <- B %*% b + eps

  result <- grpSLOPE(X=B, y=z, group=grp, fdr=fdr, lambda="corrected",
                     orthogonalize = FALSE, normalize = FALSE)
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.beta, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1, 3))
  expect_identical(result$group, grp)
  expect_identical(result$group.c, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "corrected")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 0, tolerance=1e-5)
})

test_that("corrected lambdas can't be computed unless groups sizes are small enough compared to sample size", {
  M <- matrix(rnorm(130), 10, 13)
  bm <- 1:13
  grp.M <- c(rep(1, 11), 2, 2)
  y <- M %*% bm + eps
  expect_error(grpSLOPE(X=M, y=y, group=grp.M, fdr=fdr, lambda="corrected",
                        orthogonalize = FALSE, normalize = FALSE),
               regexp = "Corrected lambdas cannot be computed unless groups sizes are small enough compared to sample size.")
})

#--------------------------------------------------------------------------
context("grpSLOPE(lambda = 'mean')")

sol.beta <- c(0, 0, 17.570533, 4.932366, 0, 0, 0, 0, 0, 0)
sol.c <- c(0, 0, 17.022493, 4.901825, 0, 0, 0, 0, 0, 0)
sol.group.norms <- c(0, 17.71421, 0, 0)
sol.beta.original.scale <- c(0, 0, 32.492927, 5.776856, 0, 0, 0, 0, 0, 0)
sol.intercept <- 1.729414

test_that("when the groups are consecutive blocks", {
  result <- grpSLOPE(X=A, y=y, group=grp, fdr=fdr, lambda="mean")
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.c, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_identical(as.numeric(result$selected), c(1))
  expect_identical(result$group, grp)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "mean")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("when the groups are not consecutive blocks", {
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="mean")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_true(result$optimal)
  expect_identical(result$group, grp[ord])
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "mean")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with non-zero intercept", {
  y <- y - 10
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="mean")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_true(result$optimal)
  expect_identical(result$group, grp[ord])
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "mean")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, -8.270585, tolerance=1e-5)
})

test_that("when group submatrix has more columns than rows", {
  M <- cbind(A, A[ , 1:3])
  bm <- c(b, 0, 10, 10)
  grp.M <- c(rep(1, 11), 2, 2)
  y <- M %*% bm + eps

  result <- grpSLOPE(X=M, y=y, group=grp.M, fdr=fdr, lambda="mean")
  expect_null(result$beta)
  expect_equal(as.numeric(result$group.norms), c(0, 21.34535), tolerance=1e-5)
  expect_equal(length(result$c), 12)
  expect_equal(ncol(M), 13)
  expect_identical(result$selected, "2")
  expect_identical(result$group, grp.M)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "mean")
  expect_is(result$sigma, "numeric")
  expect_null(result$original.scale$beta)
  expect_null(result$original.scale$intercept)
})

#--------------------------------------------------------------------------
context("grpSLOPE(lambda = 'max')")

sol.c <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
sol.beta <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
sol.group.norms <- c(0, 0, 0, 0)
sol.beta.original.scale <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
sol.intercept <- 4.101428 

test_that("when the groups are consecutive blocks", {
  result <- grpSLOPE(X=A, y=y, group=grp, fdr=fdr, lambda="max")
  expect_equal(result$beta, sol.beta, tolerance=1e-5)
  expect_equal(result$c, sol.c, tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms), sol.group.norms, tolerance=1e-5)
  expect_true(length(result$selected) == 0)
  expect_true(result$optimal)
  expect_identical(result$group, grp)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "max")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("when the groups are not consecutive blocks", {
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="max")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_true(result$optimal)
  expect_identical(result$group, grp[ord])
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "max")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with non-zero intercept", {
  y <- y + pi
  ord <- sample(1:10, 10)
  result <- grpSLOPE(X=A[ , ord], y=y, group=grp[ord], fdr=fdr, lambda="max")
  expect_equal(result$beta, sol.beta[ord], tolerance=1e-5)
  expect_equal(as.numeric(result$group.norms["1"]), sol.group.norms[2], tolerance=1e-5)
  expect_true(result$optimal)
  expect_identical(result$group, grp[ord])
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "max")
  expect_is(result$sigma, "numeric")
  expect_equal(result$original.scale$beta, sol.beta.original.scale[ord], tolerance=1e-5)
  expect_equal(result$original.scale$intercept, 7.243021, tolerance=1e-5)
})

test_that("when group submatrix has more columns than rows", {
  M <- cbind(A, A[ , 1:3])
  bm <- c(b, 0, 10, 10)
  grp.M <- c(rep(1, 11), 2, 2)
  y <- M %*% bm + eps

  result <- grpSLOPE(X=M, y=y, group=grp.M, fdr=fdr, lambda="max")
  expect_null(result$beta)
  expect_equal(as.numeric(result$group.norms), c(0, 20.32926), tolerance=1e-5)
  expect_equal(length(result$c), 12)
  expect_equal(ncol(M), 13)
  expect_identical(result$selected, "2")
  expect_identical(result$group, grp.M)
  expect_true(result$optimal)
  expect_is(result$iter, "numeric")
  expect_is(result$lambda, "numeric")
  expect_true(result$lambda.method == "max")
  expect_is(result$sigma, "numeric")
  expect_null(result$original.scale$beta)
  expect_null(result$original.scale$intercept)
})

#--------------------------------------------------------------------------
context("grpSLOPE is equivalent to SLOPE when each group is a singleton")

sol.beta.original.scale <- c(0, 0, 43.006608, 5.986979, 0, 0, 0, 7.515134, 0, 0)
sol.intercept <- 0.6152246

test_that("with lambda = 'max'", {
  # compare to results obtained with package SLOPE
  result.grpSLOPE <- grpSLOPE(X=A, y=y, group=1:10, fdr=fdr, lambda="max", sigma=1)
  result.SLOPE <- SLOPE::SLOPE(X=A, y=y, fdr=fdr, lambda="bhq", sigma=1)

  expect_equal(result.grpSLOPE$beta, result.SLOPE$beta, tolerance=1e-5)
  expect_equal(as.numeric(result.grpSLOPE$group.norms),  result.SLOPE$beta, tolerance=1e-5)
  expect_identical(as.numeric(result.grpSLOPE$selected), as.numeric(result.SLOPE$selected))
  expect_identical(result.grpSLOPE$group, 1:10)
  expect_true(result.grpSLOPE$optimal)
  expect_is(result.grpSLOPE$iter, "numeric")
  expect_equal(result.grpSLOPE$lambda, result.SLOPE$lambda, tolerance=1e-5)
  expect_true(result.grpSLOPE$lambda.method == "max")
  expect_identical(result.grpSLOPE$sigma, 1)

  expect_equal(result.grpSLOPE$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result.grpSLOPE$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with lambda = 'max', orthogonalize = FALSE", {
  # compare to results obtained with package SLOPE
  result.grpSLOPE <- grpSLOPE(X=A, y=y, group=1:10, fdr=fdr, lambda="max",
                              orthogonalize=FALSE, sigma=1)
  result.SLOPE <- SLOPE::SLOPE(X=A, y=y, fdr=fdr, lambda="bhq", sigma=1)

  expect_equal(result.grpSLOPE$beta, result.SLOPE$beta, tolerance=1e-5)
  expect_equal(as.numeric(result.grpSLOPE$group.norms),  result.SLOPE$beta, tolerance=1e-5)
  expect_identical(as.numeric(result.grpSLOPE$selected), as.numeric(result.SLOPE$selected))
  expect_identical(result.grpSLOPE$group, 1:10)
  expect_identical(result.grpSLOPE$group.c, 1:10)
  expect_true(result.grpSLOPE$optimal)
  expect_is(result.grpSLOPE$iter, "numeric")
  expect_equal(result.grpSLOPE$lambda, result.SLOPE$lambda, tolerance=1e-5)
  expect_true(result.grpSLOPE$lambda.method == "max")
  expect_identical(result.grpSLOPE$sigma, 1)

  expect_equal(result.grpSLOPE$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result.grpSLOPE$original.scale$intercept, sol.intercept, tolerance=1e-5)
})

test_that("with lambda = 'max', and non-zero intercept", {
  y <- y - 10
  # compare to results obtained with package SLOPE
  result.grpSLOPE <- grpSLOPE(X=A, y=y, group=1:10, fdr=fdr, lambda="max", sigma=1)
  result.SLOPE <- SLOPE::SLOPE(X=A, y=y, fdr=fdr, lambda="bhq", sigma=1)

  expect_equal(result.grpSLOPE$beta, result.SLOPE$beta, tolerance=1e-5)
  expect_equal(as.numeric(result.grpSLOPE$group.norms),  result.SLOPE$beta, tolerance=1e-5)
  expect_identical(as.numeric(result.grpSLOPE$selected), as.numeric(result.SLOPE$selected))
  expect_identical(result.grpSLOPE$group, 1:10)
  expect_true(result.grpSLOPE$optimal)
  expect_is(result.grpSLOPE$iter, "numeric")
  expect_equal(result.grpSLOPE$lambda, result.SLOPE$lambda, tolerance=1e-5)
  expect_true(result.grpSLOPE$lambda.method == "max")
  expect_identical(result.grpSLOPE$sigma, 1)

  expect_equal(result.grpSLOPE$original.scale$beta, sol.beta.original.scale, tolerance=1e-5)
  expect_equal(result.grpSLOPE$original.scale$intercept, -9.384775, tolerance=1e-5)
})
