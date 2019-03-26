context("egp3")

test_that("egp3 family behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  library(MASS)
  rmod <- rlm(log(ALT.M) ~ log(ALT.B) + as.numeric(dose), data=liver, method="MM", c=3.44)
  liver$r <- resid(rmod)

  # Check that GPD and EGP3 match when log(k) is effectively constrained to 0
  gpmod <- evm(liver[liver$dose == "D", "r"], qu=.6)
  pp <- list(c(0, 0, 0), diag(c(10^(-10), 10^4, 10^4)))
  e3mod <- evm(liver[liver$dose == "D", "r"], qu=.6, family=egp3, priorParameters=pp)

  # Test the point estimates, standard errors and t-values all at once
  expect_that(coef(summary(gpmod)), equals(coef(summary(e3mod))[-1, ], tol=.0001), label="egp3: matches gpd")

  # Check SEs on return levels - derivatives were worked out manually (by Paul),
  # also by Sage and (I think) by Wolfram
  rgp <- do.call("rbind", predict(gpmod, M=seq(100, 2000, by=100), se.fit=TRUE)$obj)
  re3 <- do.call("rbind", predict(e3mod,  M=seq(100, 2000, by=100), se.fit=TRUE)$obj)
  expect_that(rgp, equals(re3, tol=.0001), label="egp3: return levels")

  # Check that the plot for the Nidd data has generally similar shape to that in
  # Papastathopoulos and Tawn: they use EGP1, not 3, so the plots won't be the same
  plot(egp3RangeFit(nidd, umin=65, umax=90, nint=50), pch=16)

  })

test_that("regp3 behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  regp3_test <- function(n, kappa=1, sigma, xi, u=0){
    # Implement rng via direct cdf inversion and compare to version that uses qegp3
    kappa <- rep(kappa, length.out=n)
    sigma <- rep(sigma, length.out=n)
    xi <- rep(xi, length.out=n)
    u <- rep(u, length.out=n)

    nk1 <- sum(kappa != 1)

    x <- 1 - runif(nk1)^(1/kappa)

    xi.neq.0 <- function(x, xi, sigma, u) (x^(-xi) - 1) * sigma / xi + u
    xi.eq.0 <- function(x, xi, sigma, u) log(x) * sigma / xi + u

    res <- ifelse(xi == 0, xi.eq.0(x, xi, sigma, u), xi.neq.0(x, xi, sigma, u))

    if (nk1 < n){
      res2 <- rgpd(n - nk1, sigma, xi, u)
      r <- rep(0, n)
      r[kappa != 1] <- res
      r[kappa == 1] <- res2
      r
    } else res
  }

  par(mfrow=c(3, 3), oma=c(0, 0, 2, 0))
  for (i in 1:9){
    kappa <- runif(1); sigma <- runif(1, .1, 6); xi <- runif(1); u <- runif(1, -10, 10)
    x1 <- sort(regp3_test(1000, kappa=.5, sigma=2, xi=.2, u=6))
    x2 <- sort(regp3(1000, kappa=.5, sigma=2, xi=.2, u=6))
    expect_gt(cor(x1, x2), 0.90)
    plot(x1, x2); abline(0, 1)
  }
  title("Comparing 2 implementations of EGP3 rng", outer=TRUE)
}) # Close test_that

test_that("qegp3 behaves as expected", {
  skip_on_cran()
  skip_on_travis()
  # Note that regp3 calls on qegp3, so some implicit testing is performed by the
  # regp3 tests. Also, qegp3 calls on qgpd, so again some implicit testing is done
  # there.

  # Test for error with out of range probabiliites
  expect_error(qegp3(-.1, xi=.2, sigma=1))
  expect_error(qegp3(1.1, xi=.2, sigma=1))

  # Check boundaries
  expect_equal(qegp3(0, xi=.2, sigma=1, kappa=runif(1)), 0)
  expect_equal(qegp3(1, xi=.2, sigma=1, kappa=runif(1)), Inf)

  # Check that qegp3 and pegp3 reverse each other
  myTest <- function(sig, xi, kappa, thresh, msg){
    myq <- sapply(1:nreps,function(i) qegp3(x[,i], sig[i], xi[i], kappa[i], u=thresh[i]))
    myp <- sapply(1:nreps,function(i) pegp3(myq[,i], sig[i], xi[i], kappa[i], u=thresh[i]))
    expect_that(x, equals(myp), label=paste(msg,"testusingqgpd"))
  }

  nreps <- 100
  nsim <- 1000
  p <- matrix(runif(2*nreps, -1, 1), ncol=2)
  p <- cbind(p, runif(nreps)*3)
  p[, 1] <- p[, 1] + 1
  thresh <- rep(0,nreps)
  x <- matrix(runif(nreps*nsim), nrow=nsim)

  myTest(sig=p[,1], xi=p[,2], kappa=p[,3], thresh=thresh, msg="qgpd: random xi")

  # Check that qegp3 gives same answer on log scale
  p <- qegp3(0.95, kappa=0.5, sigma=1, xi=.01)
  p2 <- qegp3(log(0.95), kappa=0.5, sigma=1, xi=.01, log.p=TRUE)
  expect_equal(p, p2, label="qegp3 returns same answer on log and untransformed scale, lower tail")

  p <- qegp3(0.95, kappa=0.5, sigma=1, xi=.01, lower.tail=FALSE)
  p2 <- qegp3(log(0.95), kappa=0.5, sigma=1, xi=.01, log.p=TRUE, lower.tail=FALSE)
  expect_equal(p, p2, label="qegp3 returns same answer on log and untransformed scale, upper tail")
})

test_that("pegp3 behaves as expected", {
  skip_on_cran()
  skip_on_travis()
  # pegp3 does some /fairly/ simple stuff and calls on pgpd, so the testing of
  # pgpd implicitly does some testing of pegp3. Also the test of qegp3 implicity
  # tests pegp3

  for (i in 1:10){
    s <- runif(100) + 1
    xi <- runif(100, -1, 1)
    k <- runif(100) * 3
    p <- runif(100)

    # Test lower.tail argument
    x <- pegp3(p, sigma=s, xi=xi, kappa=k)
    y <- 1 - pegp3(p, sigma=s, xi=xi, kappa=k, lower.tail=FALSE)
    expect_equal(x, y)

    # Test wtih log.p
    x <- exp(pegp3(p, sigma=s, xi=xi, kappa=k, log.p=TRUE))
    y <- 1 - exp(pegp3(p, sigma=s, xi=xi, kappa=k, lower.tail=FALSE, log.p=TRUE))
    expect_equal(x, y)
  }
})

test_that("degp3 behaves as expected", {
  skip_on_cran()
  skip_on_travis()
  degp3_test <- function(x, kappa=1, sigma, xi){
    y <- 1 + x * xi/sigma
    res <- log(kappa/sigma) + (kappa - 1) * log(1 - y^(-1/xi)) - (1/xi + 1) * log(y)
    exp(res)
  }

  for (i in 1:10){
    xi <- runif(1, -0.4999, .9999)
    kappa <- runif(1) * 3
    sigma <- runif(1) + 1

    x <- regp3(100, sigma=sigma, xi=xi, kappa=kappa)
    d1 <- degp3(x, sigma=sigma, xi=xi, kappa=kappa)
    d2 <- degp3_test(x, sigma=sigma, xi=xi, kappa=kappa)

    # Clunky workaround: some combinations generate numbers absurdly small or large
    # that degp3_test evaluates to +/- Inf
    d1 <- d2[d2 > 1e-20 & d2 < 1e20]
    d2 <- d2[d2 > 1e-20 & d2 < 1e20]
    expect_that(d1, equals(d2, tol=1.0e-02))
  }
})

