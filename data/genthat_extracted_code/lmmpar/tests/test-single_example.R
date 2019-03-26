context("single_example")


test_that("single example", {

  set.seed(4321)
  is_personal <- !is.na(file.info(file.path("..", "..", ".lintr"))$size)
  cores_vals <- 1
  n <- 5000 # number of subjects
  if (is_personal) {
    cores_vals <- c(cores_vals, 2, 4)
    n <- 10000
  }
  m <- 4
  N <- n * m
  p <- 20
  q <- 2

  # Initial parameters
  beta <- rbind(1, matrix(mnormt::rmnorm(p, 10, 1), p, 1))
  R <- diag(m)
  D <- matrix(c(16, 0, 0, 0.025), nrow = q)
  sigma <- 1

  beta_start <- beta
  R_start <- R
  D_start <- D
  sigma_start <- sigma

  # set up data
  subject <- rep(1:n, each = m)
  repeats <- rep(1:m, n)

  myresult_x <- lapply(1:n, function(i) cbind(1, matrix(rnorm(m * p), nrow = m)))
  X <- do.call(rbind, myresult_x)
  Z <- X[, 1:q]
  myresult_b <- lapply(1:n, function(i) mnormt::rmnorm(1, rep(0, q), D))
  myresult_e <- lapply(1:n, function(i) mnormt::rmnorm(1, rep(0, m), sigma * R))

  # found data
  myresulty <- lapply(
    seq_len(n),
    function(i) {
      (myresult_x[[i]] %*% beta) +
        (myresult_x[[i]][, 1:q] %*% myresult_b[[i]]) +
        myresult_e[[i]]
    }
  )
  y <- do.call(rbind, myresulty)

  if (is_personal) cat("\nstarting timings...\n\n")

  timings <- list()
  pars <- list()
  for (i in seq_along(cores_vals)) {
    timing <- system.time({
      ans.gauss <- lmmpar(
        y,
        X,
        Z,
        subject,
        beta = beta,
        R = R,
        D = D,
        cores = cores_vals[i],
        sigma = sigma,
        verbose = is_personal
      )
    })
    if (is_personal) print(ans.gauss)
    expect_true(abs(ans.gauss$beta[1, 1] - 1) < 2)
    expect_true(all(ans.gauss$beta[-1, 1] > 5))

    if (is_personal) print(timing)
    timing <- as.list(timing)
    timing$cores <- cores_vals[i]
    timing$n <- n
    timing$repeats <- m
    timing$p <- p
    timings[[i]] <- timing

    pars$Beta_start <- beta_start
    pars$R_start <- R_start
    pars$D_start <- D_start
    pars$sigma_start <- sigma_start

    expect_true(TRUE)
  }

  if (is_personal) {
    cat("\n")
    print(as.data.frame(do.call(rbind, timings)))
    print(pars)
  }

})


if (FALSE) {
  # nolint start
  # Y <- as.vector(y)
  # m1 <- lme4::lmer(Y~X2+(1|subject)+(Z2-1|subject),REML=FALSE)
  # AICGauss <- 2*61-2*logLik(m1,REML=FALSE)
  # summary(m1)$coefficients[,1][1]
  # summary(m1)$coefficients[,1][2]
  # unlist(summary(m1))$varcor.subject
  # unlist(summary(m1))$varcor.subject.1
  # sigma(m1)
  #
  #
  # expect_true(abs(AICGauss - ans$AIC) < 10)
  #
  # expect_equal(length(ans), 7)
  # nolint end
}
