context("robust ee")
test_that("estimation equations are computed correctly", {

    set.seed(1)

    X <- cbind(1, 1:10)
    u <- rnorm(10)
    sigu <- var(u)
    y <- X %*% c(1, 1) + u

    matV <- matVFH(sigu, rep(0.01, 10))
    coefs <- .lm.fit(X, y)$coefficients
    uest <- .lm.fit(X, y)$residuals

    ree <- robEstEqu(y, X, coefs, uest, matV, identity, 1)

    testthat::expect_equal(ree$beta(), c(0, 0))

    # How to get the other vals to zero without fitting the model is beyond me:
    testthat::expect_is(ree$delta(), "numeric")
    testthat::expect_equal(length(ree$delta()), 1)

    testthat::expect_is(ree$re(), "numeric")
    testthat::expect_equal(length(ree$re()), 10)

})

test_that("score interface", {

  library("saeSim")
  set.seed(1)
  dat <- base_id(10, 1) %>%
    sim_gen_e() %>%
    sim_gen_x() %>%
    sim_gen_v(sd = 2) %>%
    sim_resp_eq(y = 100 + 2 * x + v + e) %>%
    as.data.frame

  y <- dat$y
  X <- cbind(1, dat$x)
  samplingVar <- rep(1, nrow(dat))

  out <- saeRobust:::fitrfh(y, X, samplingVar)
  scores <- score(out)

  testthat::expect_equal(unlist(scores), rep(0, 13), tolerance = 10, check.attributes = FALSE)

})

