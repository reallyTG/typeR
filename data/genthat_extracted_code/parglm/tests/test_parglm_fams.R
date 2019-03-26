context("testing results with varrious link functions agianst `glm.fit`")

to_check <- c(
  "coefficients", "residuals", "fitted.values", "rank",
  "family", "linear.predictors", "deviance", "aic", "null.deviance",
  "iter", "prior.weights", "df.residual", "df.null",
  "converged", "boundary", "formula", "terms", "data",
  "offset", "contrasts", "xlevels")

sim_func <- function(family, n, p){
  nam <- paste0(family$family, family$link)
  if(nam %in% c("binomiallogit", "binomialprobit", "binomialcauchit",
                "binomialcloglog")){
    sds <- p:1
    sds <- sqrt(sds^2 / sum(sds^2))
    X <- matrix(nrow = n, ncol = p)
    set.seed(77311413)
    for(i in 1:p)
      X[, i] <- rnorm(n, 0, sds[i])
    y <- family$linkinv(rowSums(X) + 1) > runif(n)

  } else if(nam %in% "binomiallog"){
    X <- matrix(runif(n * p, -1 / (4 * p), 1 / (4 * p)), n) - 3/(2 * p)
    y <- family$linkinv(rowSums(X) + 1) > runif(n)

  } else if(nam %in% c("gaussianidentity", "gaussianlog")){
    sds <- p:1
    sds <- sqrt(sds^2 / sum(sds^2))
    X <- matrix(nrow = n, ncol = p)
    set.seed(77311413)
    for(i in 1:p)
      X[, i] <- rnorm(n, 5/p, sds[i])
    y <- rnorm(n, family$linkinv(rowSums(X) + 1))

  } else if(nam %in% c("gaussianinverse")){
    sds <- p:1
    sds <- sqrt(sds^2 / sum(sds^2))
    X <- matrix(nrow = n, ncol = p)
    set.seed(77311413)
    for(i in 1:p)
      X[, i] <- rnorm(n, -1/p, sds[i])
    y <- rnorm(n, family$linkinv(rowSums(X) + 1))

  } else if(nam %in% c("Gammainverse", "Gammaidentity", "Gammalog")){
    sds <- p:1
    sds <- sqrt(sds^2 / sum(sds^2))
    X <- matrix(nrow = n, ncol = p)
    set.seed(77311413)
    for(i in 1:p)
      X[, i] <- rnorm(n, 5/p, sds[i])
    y <- rgamma(n, family$linkinv(rowSums(X) + 1))

  }  else if(nam %in% c("poissonlog", "poissonidentity", "poissonsqrt")){
    sds <- p:1
    sds <- sqrt(sds^2 / sum(sds^2))
    X <- matrix(nrow = n, ncol = p)
    set.seed(77311413)
    for(i in 1:p)
      X[, i] <- rnorm(n, 4/p, sds[i])
    y <- rpois(n, family$linkinv(rowSums(X) + 1))

  } else if(nam %in% c("inverse.gaussian1/mu^2", "inverse.gaussianinverse",
                       "inverse.gaussianidentity", "inverse.gaussianlog")){
    set.seed(77311413)
    X <- matrix(runif(n * p, 1e-5, 1/p), nrow = n, ncol = p)
    y <- SuppDists::rinvGauss(n, family$linkinv(rowSums(X) + 1), 1)

  } else stop("family not implemented")

  list(X = X, y = y)
}

test_expr <- expression({
  is_FAST <- method == "FAST"
  expect_equal(f1[to_check], f2[to_check], label = lab,
               tolerance = if(is_FAST) 1e-6 else 1e-8)
  # these may differ as `glm.fit` uses the weights from the iteration prior
  # to convergence
  expect_equal(f1$weights, f2$weights, tolerance = sqrt(1e-7), label = lab)

  s2 <- summary(f2)
  s1 <- summary(f1)

  excl <- c("call", "coefficients", "cov.unscaled", "cov.scaled",
            "dispersion")
  expect_equal(s1[!names(s1) %in% excl], s2[!names(s2) %in% excl],
               label = lab, tolerance = if(is_FAST) 5e-6 else 1e-7)
  na <- rownames(s1$coefficients)
  expect_equal(s1$coefficients[na, 1:2], s2$coefficients[na, 1:2],
               label = lab, tolerance = sqrt(1e-7))

  # may also differ as the weights are not computed at the final estimates
  expect_equal(s1$dispersion, s2$dispersion, label = lab,
               tolerance = sqrt(1e-7))
})

test_that("works with different families", {
  skip_if_not_installed("SuppDists")
  n <- 1000L
  p <- 5L
  set.seed(77311413)
  for(method in c("LAPACK", "LINPACK", "FAST"))
  for(fa in list(
    binomial("logit"), binomial("probit"), binomial("cauchit"),
    binomial("cloglog"),

    gaussian("identity"), gaussian("inverse"),
    gaussian("log"),

    Gamma("identity"), Gamma("log"),

    poisson("log"), poisson("sqrt")))
  {
    tmp <- sim_func(fa, n, p)
    df <- data.frame(y = tmp$y, tmp$X)

    #####
    # no weights, no offset
    lab <- paste0(fa$family, "_", fa$link, "_", method)
    frm <- y ~ X1 + X2 + X3 + X4 + X5
    suppressWarnings({
      f2 <- glm(frm, family = fa, data = df)
      f1 <- parglm(frm, family = fa, data = df,
                   control = parglm.control(nthreads = 2, method = method))
    })

    eval(test_expr)

    #####
    # no weights, offset
    lab <- paste0(fa$family, "_", fa$link, "_", method, " w/ offset")
    frm_off <- update(frm, . ~ . - X1)
    suppressWarnings({
      f2 <- glm(frm_off, family = fa, offset = X1, data = df)
      f1 <- parglm(frm_off, family = fa, offset = X1, data = df,
                   control = parglm.control(nthreads = 2, method = method))
    })

    eval(test_expr)

    #####
    # weights, no offset
    lab <- paste0(fa$family, "_", fa$link, "_", method, " w/ weigths")
    w <- runif(n)
    df$w <- n * w / sum(w)
    suppressWarnings({
      f2 <- glm(frm, family = fa, weights = w, data = df)
      f1 <- parglm(frm, family = fa, weights = w, data = df,
                   control = parglm.control(nthreads = 2, method = method))
    })

    eval(test_expr)
  }
})


test_that("works with different families w/ starting values", {
  skip_if_not_installed("SuppDists")
  n <- 1000L
  p <- 5L
  set.seed(77311413)
  for(method in c("LAPACK", "LINPACK", "FAST"))
  for(fa in list(
    binomial("logit"), binomial("probit"), binomial("cauchit"),
    binomial("cloglog"), binomial("log"),

    gaussian("identity"), gaussian("inverse"),
    gaussian("log"),

    Gamma("identity"), Gamma("log"), Gamma("log"),

    poisson("log"), poisson("sqrt"), poisson("identity"),

    inverse.gaussian("1/mu^2"), inverse.gaussian("inverse"),
    inverse.gaussian("identity"), inverse.gaussian("log")))
  {
    tmp <- sim_func(fa, n, p)
    df <- data.frame(y = tmp$y, tmp$X)

    #####
    # no weights, no offset
    lab <- paste0(fa$family, "_", fa$link, "_", method)
    sta <- rep(1, p + 1L)
    frm <- y ~ X1 + X2 + X3 + X4 + X5
    suppressWarnings({
      f2 <- glm(frm, family = fa, start = sta, data = df)
      f1 <- parglm(frm, family = fa, data = df,
                   control = parglm.control(nthreads = 2, method = method),
                   start = sta)
    })

    eval(test_expr)

    #####
    # no weights, offset
    lab <- paste0(fa$family, "_", fa$link, "_", method, " w/ offset")
    sta <- rep(1, p)
    frm_off <- update(frm, . ~ . - X1)
    suppressWarnings({
      f2 <- glm(frm_off, family = fa, offset = X1, start = sta, data = df)
      f1 <- parglm(frm_off, family = fa, offset = X1, data = df,
                   control = parglm.control(nthreads = 2, method = method),
                   start = sta)
    })

    eval(test_expr)

    #####
    # weights, no offset
    lab <- paste0(fa$family, "_", fa$link, "_", method, " w/ weigths")
    w <- runif(n)
    df$w <- n * w / sum(w)
    sta <- rep(1, p + 1L)
    suppressWarnings({
      f2 <- glm(frm, family = fa, weights = w, start = sta, data = df)
      f1 <- parglm(frm, family = fa, weights = w, start = sta, data = df,
                   control = parglm.control(nthreads = 2, method = method))
    })

    eval(test_expr)
  }
})

test_that("'method' equal to 'LINPACK' behaves as 'glm'", {
  set.seed(73640893)
  n <- 1000
  p <- 5
  X <- matrix(nrow = n, ncol = p)
  for(i in 1:p)
    X[, i] <- rnorm(n, sd = sqrt(p - i + 1L))
  y <- rnorm(n) + rowSums(X)
  X <- cbind(X[, 1:3], X[, 3:p])

  f1 <- glm(y ~ X)
  f2 <- parglm(y ~ X, control = parglm.control(method = "LINPACK"))

  expect_equal(f1[to_check], f2[to_check])

  s1 <- summary(f1)
  s2 <- summary(f2)


  excl <- c("call", "coefficients", "cov.unscaled", "cov.scaled",
            "dispersion")
  expect_equal(s1[!names(s1) %in% excl], s2[!names(s2) %in% excl])
  expect_equal(s1$coefficients, s2$coefficients)

  # may also differ as the weights are not computed at the final estimates
  expect_equal(s1$dispersion, s2$dispersion)
})

test_that("'FASTs' fail when design matrix is singular", {
  set.seed(73640893)
  n <- 1000
  p <- 5
  X <- matrix(nrow = n, ncol = p)
  for(i in 1:p)
    X[, i] <- rnorm(n, sd = sqrt(p - i + 1L))
  y <- rnorm(n) + rowSums(X)
  X <- cbind(X[, 1:3], X[, 3:p])
  X <- cbind(X, X)

  suppressMessages(expect_error(
    f2 <- parglm(y ~ X, control = parglm.control(method = "FAST"))))
})

test_that("'parglm' yields the same as 'glm' also when one observations is not 'good'",{
  phat <- seq(.01, .99, by = .01)
  X <- log(phat / (1 - phat)) - 2
  set.seed(47313714)
  Y <- phat > runif(length(phat))

  W <- rep(1, length(Y))
  W[1] <- 0
  fit <- suppressWarnings(glm(Y ~ X, binomial(), weights = W))
  pfit <- parglm(Y ~ X, binomial(), weights = W,
                 control = parglm.control(nthreads = 2))
  expect_equal(fit[to_check], pfit[to_check])

  Y <- rev(Y)
  X <- rev(X)
  W <- rev(W)
  fit <- suppressWarnings(glm(Y ~ X, binomial(), weights = W))
  pfit <- parglm(Y ~ X, binomial(), weights = W,
                 control = parglm.control(nthreads = 2))
  expect_equal(fit[to_check], pfit[to_check])
})
