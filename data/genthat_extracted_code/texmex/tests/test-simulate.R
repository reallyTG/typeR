context("simulate")

test_that("simulate.evm functions behave as expected", {
  skip_on_cran()
  skip_on_travis()
  ##############################################################################
  ##################################### GPD ####################################

  scor <- function(x, y) cor(sort(x), sort(y))

  nrain <- length(rain[rain > quantile(rain, .95)])

  # Compare simulate.evmOpt with rgpd
  m <- evm(rain, qu=.95)
  s1 <- simulate(m, nsim=1, seed=1234)
  set.seed(1234)
  s2 <- rgpd(nrain, exp(coef(m)[1]), coef(m)[2])
  expect_equal(cor(s1, s2), 1, label="Compare simulate.evmOpt with rgpd")

  # Compare simulate.evmSim with rgpd
  ms <- evm(rain, qu=.95, method="sim", iter=1500, burn=500, thin=1)
  s1 <- simulate(ms)
  s2 <- rgpd(nrain, exp(ms$param[1:nrain, 1]), ms$param[1:nrain, 2])
  expect_gt(scor(s1, s2), .98, label="Compare simulate.evmSim with rgpd")
  
  # Compare simulate.evmBoot with rgpd
  mb <- evm(rain, qu=.95, method="boot", R=1000)
  s1 <- simulate(mb)
  s2 <- rgpd(nrain, exp(mb$replicates[1:nrain, 1]), mb$replicates[1:nrain, 2])
  expect_gt(scor(s1, s2), .98, label="Compare simulate.evmBoot with rgpd")

  ##############################################################################
  # Check nsim argument
  s <- simulate(m, nsim=2)
  expect_equal(nrow(s), nrain)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .98)
  
  s <- simulate(ms, nsim=2)
  expect_equal(nrow(s), nrain)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .98)

  s <- simulate(mb, nsim=2)
  expect_equal(nrow(s), nrain)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .98)

  ##############################################################################
  ##################################### GEV ####################################

  nsea <- nrow(portpirie)

  # Compare simulate.evmOpt with rgev
  m <- evm(SeaLevel, portpirie, family=gev)
  s1 <- simulate(m, nsim=1, seed=1234)
  set.seed(1234)
  s2 <- rgev(nsea, coef(m)[1], exp(coef(m)[2]), coef(m)[3])
  expect_equal(cor(s1, s2), 1, label="Compare simulate.evmOpt with rgev")

  # Compare simulate.evmSim with rgev
  ms <- evm(SeaLevel, portpirie, family=gev, method="sim", iter=1500, burn=500, thin=1)
  s1 <- simulate(ms)
  s2 <- rgev(nsea, ms$param[, 1], exp(ms$param[, 2]), ms$param[, 3])
  expect_gt(scor(s1, s2), .85, label="Compare simulate.evmSim with rgev")
  
  # Compare simulate.evmBoot with rgev
  mb <- evm(SeaLevel, portpirie, family=gev, method="boot", R=1000)
  s1 <- simulate(mb)
  s2 <- rgev(nsea, mb$replicates[, 1], exp(mb$replicates[, 2]), mb$replicates[, 3])
  expect_gt(scor(s1, s2), .85, label="Compare simulate.evmBoot with rgev")

  ##############################################################################
  # Check nsim argument
  m <- evm(SeaLevel, portpirie, family=gev)
  s <- simulate(m, nsim=2)
  expect_equal(nrow(s), nsea)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .85)

  s <- simulate(ms, nsim=2)
  expect_equal(nrow(s), nsea)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .85)

  s <- simulate(mb, nsim=2)
  expect_equal(nrow(s), nsea)
  expect_equal(ncol(s), 2)
  expect_gt(scor(s[, 1], s[, 2]), .85)
})