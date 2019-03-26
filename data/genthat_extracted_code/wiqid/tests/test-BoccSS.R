
# test_that code for BoccSS0 and BoccSS

# library(testthat)
require(wiqid)

context("Bayesian occupancy models")

test_that("BoccSS0 gives same answers",  {
  # Use the salamanders data
  data(salamanders)
  y <- rowSums(salamanders)
  n <- rowSums(!is.na(salamanders))
  set.seed(123)
  Bout <- BoccSS0(y, n)
  expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
  expect_that(dim(Bout), equals(c(30000, 2)))
  expect_that(names(Bout), equals(c("psi", "p")))
  expect_that(attr(Bout, "header"),
    equals("Model fitted in R with a Gibbs sampler"))
  expect_that(attr(Bout, "n.chains"), equals(3))
  expect_equivalent(round(attr(Bout, "n.eff")), c(4317, 5927))
  expect_equivalent(round(attr(Bout, "Rhat"), 3), c(1.000, 1.002))
  expect_equal(as.character(attr(Bout, "call")), c("BoccSS0", "y", "n"))

  expect_equivalent(round(colMeans(Bout), 4), c(0.6152, 0.2580))
  expect_equivalent(round(c(hdi(Bout)), 4),
    c(0.3770, 0.8620, 0.1504, 0.3660))

  set.seed(234)
  Bout <- BoccSS0(y, n, psiPrior=c(5,5), pPrior=c(3,3),
                    chains=4, sample=4000, burnin=10)
  expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
  expect_that(dim(Bout), equals(c(4000, 2)))
  expect_that(attr(Bout, "n.chains"), equals(4))
  expect_equivalent(round(attr(Bout, "n.eff")), c(1415, 1580))
  expect_equivalent(round(attr(Bout, "Rhat"), 3), c(1.007, 1.007))
  expect_equal(as.character(attr(Bout, "call")),
    c("BoccSS0", "y", "n", "c(5, 5)", "c(3, 3)", "4", "4000", "10" ))

  expect_equivalent(round(colMeans(Bout), 4), c(0.5622, 0.2814))
  expect_equivalent(round(c(hdi(Bout)), 4),
    c(0.3998, 0.7544, 0.1771, 0.3789))
})
# ............................................................

if(parallel::detectCores() > 3) {
  test_that("BoccSS parallel gives same answers",  {
    # Use the weta data
    data(weta)
    DH <- weta[, 1:5]
    weta.covs <- weta[, 6:11]

    expect_message({Bout <- BoccSS(DH, sample=3000, burnin=100, seed=123)},
      "Starting MCMC run for 3 chains with 1100 iterations")
    expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
    expect_that(dim(Bout), equals(c(3000, 2)))
    expect_that(names(Bout), equals(c("psi_(Intercept)", "p_(Intercept)")))
    expect_that(attr(Bout, "header"),
      equals("Model fitted in R with a Gibbs sampler"))
    expect_that(attr(Bout, "n.chains"), equals(3))
    expect_equal(as.character(attr(Bout, "call")),
      c("BoccSS", "DH", "3000", "100", "123"))
    expect_equivalent(round(attr(Bout, "n.eff")), c(231, 386))
    expect_equivalent(round(attr(Bout, "Rhat"), 3), c(0.989, 1.006))
    expect_equivalent(round(colMeans(Bout), 4), c(0.3437, -0.3990))
    expect_equivalent(round(c(hdi(Bout)), 4),
      c(-0.1462, 0.8635, -0.6812, -0.1184))
    expect_message({Bout <- BoccSS(DH, model=list(psi~Browsed-1, p~.Time),
      data=weta,
      priors=list(sigmaPsi=c(1,1)), chains=2, sample=2000, burnin=100,
      seed=234)}, " ")
    expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
    expect_that(dim(Bout), equals(c(2000, 4)))
    expect_that(attr(Bout, "n.chains"), equals(2))
    expect_equivalent(round(attr(Bout, "n.eff")), c(257, 69, 280, 931))
    expect_equivalent(round(attr(Bout, "Rhat"), 3),
      c(0.998, 0.924, 0.994, 1.003))
    expect_equal(as.character(attr(Bout, "call")),
      c( "BoccSS", "DH", "list(psi ~ Browsed - 1, p ~ .Time)",
      "weta", "list(sigmaPsi = c(1, 1))", "2", "2000", "100", "234"))

    expect_equivalent(round(colMeans(Bout), 4),
      c(0.0212, 0.8992, -0.4255, 0.1649))
    expect_equivalent(round(c(hdi(Bout)), 3),
      c(-0.554, 0.602, 0.043, 2.255, -0.706, -0.142, -0.036, 0.373))
  })
}
# ........................................................

test_that("BoccSS sequential gives same answers",  {
  # Use the weta data
  data(weta)
  DH <- weta[, 1:5]
  weta.covs <- weta[, 6:11]

  expect_message({Bout <- BoccSS(DH, sample=3000, burnin=100, seed=123, parallel=FALSE)},
  "Starting MCMC run for 3 chains with 1100 iterations")
  expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
  expect_that(dim(Bout), equals(c(3000, 2)))
  expect_that(names(Bout), equals(c("psi_(Intercept)", "p_(Intercept)")))
  expect_that(attr(Bout, "header"), equals("Model fitted in R with a Gibbs sampler"))
  expect_that(attr(Bout, "n.chains"), equals(3))
  expect_equal(as.character(attr(Bout, "call")),
    c("BoccSS", "DH", "3000", "100", "FALSE", "123"))
  expect_equivalent(round(attr(Bout, "n.eff")), c(404, 448))
  expect_equivalent(round(attr(Bout, "Rhat"), 3), c(1.000, 0.999))
  expect_equivalent(round(colMeans(Bout), 4), c(0.2840, -0.3729))
  expect_equivalent(round(c(hdi(Bout)), 4),
    c(-0.1726,  0.7026, -0.6271, -0.1022))
  expect_message({Bout <- BoccSS(DH, model=list(psi~Browsed-1, p~.Time), data=weta,
    priors=list(sigmaPsi=c(1,1)), chains=1, sample=1000, burnin=100,
    seed=234)}, " ")
  expect_that(class(Bout), equals(c("Bwiqid", "data.frame")))
  expect_that(dim(Bout), equals(c(1000, 4)))
  expect_that(attr(Bout, "n.chains"), equals(1))
  expect_equivalent(round(attr(Bout, "n.eff")), c(111, 72, 82, 396))
  expect_true(is.null(attr(Bout, "Rhat")))
  expect_equal(as.character(attr(Bout, "call")),
    c( "BoccSS", "DH", "list(psi ~ Browsed - 1, p ~ .Time)",
    "weta", "list(sigmaPsi = c(1, 1))", "1", "1000", "100", "234"))

  expect_equivalent(round(colMeans(Bout), 4),
    c(0.0227, 0.7781, -0.4253, 0.1706))
  expect_equivalent(round(c(hdi(Bout)), 4),
    c(-0.5551, 0.6034, -0.0388, 1.5611, -0.7026, -0.1386, -0.0377, 0.3768))
})
