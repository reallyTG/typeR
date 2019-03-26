#source("./R/pairwise_latent_trawl.R")
requireNamespace("eivr", quietly = T)

context("Slice Area")
test_that("rho must be non-negative in exp trawl",
          {
            rho <- -1
            expect_that(ComputeAExp(rho), throws_error())
          })

test_that("B1 should be non-negative",
          {
            rho <- 0.2
            t1 <- 5
            t2 <- 10
            expect_gte(ComputeB1Exp(rho, t1, t2), 0.0)
            expect_gte(ComputeB1Exp(rho, t2, t1), 0.0)
          })

test_that("B3 should be non-negative",
          {
            rho <- 0.2
            t1 <- 5
            t2 <- 10
            expect_gte(ComputeB3Exp(rho, t1, t2), 0.0)
            expect_gte(ComputeB3Exp(rho, t2, t1), 0.0)
          })

test_that("B2 (intersection) should be non-negative",
          {
            rho <- 0.2
            t1 <- 5
            t2 <- 10
            expect_gte(ComputeBInterExp(rho, t1, t2), 0.0)
            expect_gte(ComputeBInterExp(rho, t2, t1), 0.0)
          })

test_that("B1 and B3 should be equal under timestamps swap",
          {
            rho <- 0.2
            t1 <- 5
            t2 <- 10
            expect_equal(ComputeB1Exp(rho, t1, t2), ComputeB3Exp(rho, t2, t1))
          })


context("Marginal Transform trick")
test_that("TrfG and TrfInverseG are the inverse of one another", {
  alpha <- 3
  beta <- 4
  kappa <- 6

  offset_scale <- 5
  offset_shape <- 2

  xs <- seq(from = 0.0, to = 500, length.out = 1000)
  g.function <- function(x){TrfG(x = x, alpha = alpha, beta = beta,
             kappa = kappa, offset_scale = offset_scale,
             offset_shape = offset_shape)}
  inv.g.function <- function(z){TrfInverseG(z = z, alpha = alpha, beta = beta,
                                 kappa = kappa, offset_scale = offset_scale,
                                 offset_shape = offset_shape)}

  zs <- xs %>% g.function() %>% inv.g.function()
  expect_equal(zs, xs)

  zs <- xs %>% inv.g.function() %>% g.function()
  expect_equal(zs, xs)
  # alpha < 0
  g.function <- function(x){TrfG(x = x, alpha = -alpha, beta = beta,
                                 kappa = kappa, offset_scale = offset_scale,
                                 offset_shape = offset_shape)}
  inv.g.function <- function(z){TrfInverseG(z = z, alpha = -alpha, beta = beta,
                                            kappa = kappa, offset_scale = offset_scale,
                                            offset_shape = offset_shape)}

  zs <- xs %>% g.function() %>% inv.g.function()
  expect_equal(zs, xs)

  xs <- seq(from = 0.0, to = 10, length.out = 1000)
  zs <- xs %>% inv.g.function() %>% g.function()
  expect_equal(zs, xs)
})


test_that("TrfG correctly transforms data w.r.t shape parameter", {
  requireNamespace("evir", quietly = T)
  set.seed(42)

  alpha <- 3
  beta <- 4
  kappa <- 6

  offset_shape <- 5
  offset_scale <- 2

  n.sample <- 10000

  test.samples <- evir::rgpd(n = n.sample, xi = 1/offset_shape, beta = offset_scale)
  trf.samples <- TrfG(test.samples, alpha=alpha, beta=beta, kappa=kappa,
                             offset_scale=offset_scale, offset_shape=offset_shape)

  fit.gpd <- evir::gpd(data = trf.samples, threshold = 0.0, method = "ml")
  xi.fit <- fit.gpd$par.ests[1]
  beta.fit <- fit.gpd$par.ests[2]
  xi.fit.ses <- fit.gpd$par.ses[1]
  beta.fit.ses <- fit.gpd$par.ses[2]
  xi.ci <- xi.fit  + c(-3, 3) * sqrt(xi.fit.ses)
  expect_true(xi.ci[1] <= 1/alpha & 1/alpha <= xi.ci[2])
})


test_that("TrfInverseG correctly transforms data w.r.t shape parameter", {
  requireNamespace("evir", quietly = T)
  set.seed(42)

  # testing with alpha > 0
  alpha <- 3
  beta <- 4
  kappa <- 6

  offset_shape <- 5
  offset_scale <- 2

  n.sample <- 10000

  test.samples <- evir::rgpd(n = n.sample, xi = 1/alpha, beta = beta+kappa)
  trf.samples <- TrfInverseG(test.samples, alpha=alpha, beta=beta, kappa=kappa,
                             offset_scale=offset_scale, offset_shape=offset_shape)

  fit.gpd <- evir::gpd(data = trf.samples, threshold = 0.0, method = "ml")
  xi.fit <- fit.gpd$par.ests[1]
  beta.fit <- fit.gpd$par.ests[2]
  xi.fit.ses <- fit.gpd$par.ses[1]
  beta.fit.ses <- fit.gpd$par.ses[2]
  xi.ci <- xi.fit  + c(-3, 3) * sqrt(xi.fit.ses) # create CI around xi
  #beta.ci <- beta.fit + c(-3, 3) * sqrt(xi.fit.ses)

  expect_true(xi.ci[1] <= 1/offset_shape & 1/offset_shape <= xi.ci[2])
  #expect_true(beta.ci[1] <= (offset_scale) & (offset_scale) <= beta.ci[2])

  # testing with alpha < 0
  alpha <- -3
  n.sample <- 5000

  test.samples <- evir::rgpd(n = n.sample, xi = 1/alpha, beta = beta+kappa)
  trf.samples <- TrfInverseG(test.samples, alpha=alpha, beta=beta, kappa=kappa,
                             offset_scale=offset_scale, offset_shape=offset_shape)
  trf.samples <- trf.samples[!is.nan(trf.samples)]

  fit.gpd <- evir::gpd(data = trf.samples, threshold = 0.0, method = "ml")
  xi.fit <- fit.gpd$par.ests[1]
  beta.fit <- fit.gpd$par.ests[2]
  xi.fit.ses <- fit.gpd$par.ses[1]
  beta.fit.ses <- fit.gpd$par.ses[2]
  xi.ci <- xi.fit  + c(-3, 3) * sqrt(xi.fit.ses) # create CI around xi
  #beta.ci <- beta.fit + c(-3, 3) * sqrt(xi.fit.ses)

  expect_true(xi.ci[1] <= 1/offset_shape & 1/offset_shape <= xi.ci[2])
  #expect_true(beta.ci[1] <= (offset_scale) & (offset_scale) <= beta.ci[2])
})




context("Pairwise terms")
test_that("Pairwise 0-0 Exp",{
  t1 <- 0.0
  t2 <- 1.0
  alpha <- -1.0
  beta <- 10
  rho <- 1.0
  kappa <- 1.0
  B1 <- ComputeB1Exp(rho, t1, t2)
  B2 <- ComputeBInterExp(rho, t1, t2)
  B3 <- ComputeB3Exp(rho, t1, t2)

  val <- PairwiseZeroZero(alpha = alpha, beta = beta,
                          B1 = B1, B2 = B2, B3 = B3,
                          kappa = kappa)
  answer <- 1 - 2 * (1 + 0.1) + (1 + 0.1)^{B1 + B3}*(1 + 0.2)^{B2}
  expect_equal(val, answer)

  # alpha > 0
  alpha <- 1.0
  val <- PairwiseZeroZero(alpha = alpha, beta = beta, B1 = B1, B2 = B2, B3 = B3,
                      kappa = kappa)
  answer <- 1 - 2 * (1 + 0.1)^{-1} + (1 + 0.1)^{-B1 - B3}*(1 + 0.2)^{-B2}
  expect_equal(val, answer)
})

test_that("Pairwise 1-0 Exp",{
  t1 <- 0.0
  t2 <- 1.0
  x1 <- 1.0
  alpha <- -1.0
  beta <- 10
  rho <- 1.0
  kappa <- 1.0
  B1 <- ComputeB1Exp(rho, t1, t2)
  B2 <- ComputeBInterExp(rho, t1, t2)
  B3 <- ComputeB3Exp(rho, t1, t2)

  # alpha > 0
  val <-PairwiseOneZero(x1 = x1, B1 = B1, B2 = B2, B3 = B3,
                     alpha = alpha, beta = beta,
                     kappa = kappa)
  answer <- -1/10 * (1+2/10)^{0} + 1/10*(1+2/10)^{B1-1}*(1+3/10)^{B2-1}*(1+0.1)^{B3}*((B1+B2)*(1+0.2)+B1/10)
  expect_equal(val, answer)

  # alpha > 0
  alpha <- 1.0
  val <- PairwiseOneZero(x1 = x1, B1 = B1, B2 = B2, B3 = B3,
                     alpha = alpha, beta = beta,
                     kappa = kappa)
  answer <- 1/10 * (1+2/10)^{-B1-B2-1} - 1/10*(1+2/10)^{-B1-1}*(1+3/10)^{-B2-1}*(1+0.1)^{-B3}*((B1+B2)*(1+0.2)+B1/10)
  expect_equal(val, answer)
})

test_that("Pairwise 1-1 Exp", {
  # Example
  t1 <- 0.0
  t2 <- 1.0

  x1 <- 1.0
  x2 <- 2.0

  alpha <- 1.0
  beta <- 10
  rho <- 1.0
  kappa <- 1.0

  B1 <- ComputeB1Exp(rho, t1, t2)
  B2 <- ComputeBInterExp(rho, t1, t2)
  B3 <- ComputeB3Exp(rho, t1, t2)
  trawlA <- B1+B2

  val <- PairwiseOneOne(x1 = x1, x2 = x2,
                  alpha = alpha, beta = beta, kappa = kappa,
                  B1 = B1, B2 = B2, B3 = B3, transformation = F)

  answer <- 1/beta^2*(1+(2*kappa+x1+x2)/beta)^{-alpha*B2/trawlA-1}
  answer <- answer*(1+(kappa+x1)/beta)^{-alpha*B1*trawlA-1}*
    (1+(kappa+x2)/beta)^{-alpha*B3/trawlA-1}
  answer <- answer * alpha^2 / trawlA^2 *
                      (B1*B2*(1+(kappa+x1+x2)/beta)*(1+(kappa+x1)/beta+1+(kappa+x2)/beta)
                       +B1*B3*(1+(2*kappa+x1+x2)/beta)^2
                       +B2*(B2+trawlA/(alpha))*(1+(kappa+x1)/beta)*(1+(kappa+x2)/beta))
  expect_equal(answer, val, tolerance = 1e-3)
})

context("Pairwise likelihood computation")
test_that("Single PL term", {
  t1 <- 1
  t2 <- 5

  alpha <- 5
  beta <- 3
  kappa <- 2
  rho <- 0.2

  B1 <- ComputeB1Exp(rho = rho, t1 = t1, t2 = t2)
  B2 <- ComputeBInterExp(rho = rho, t1 = t1, t2 = t2)
  B3 <- ComputeB3Exp(rho = rho, t1 = t1, t2 = t2)

  # 0-0
  x1 <- 0
  x2 <- 0
  val <- SinglePairPL(x1 = x1, x2 = x2, alpha = alpha,
                      beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3, transformation = F)
  answer <- PairwiseZeroZero(alpha = alpha, beta = beta, kappa = kappa,
                             B1 = B1, B2 = B2, B3 = B3)
  expect_equal(val, answer)

  # 1-0
  x1 <- 2
  x2 <- 0
  val <- SinglePairPL(x1 = x1, x2 = x2, alpha = alpha,
                      beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3, transformation = F)
  answer <- PairwiseOneZero(x1 = x1, alpha = alpha,
                               beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3, transformation = F,
                               n.moments = 0)
  expect_equal(val, answer)

  # 1-1
  x1 <- 2
  x2 <- 5
  val <- SinglePairPL(x1 = x1, x2 = x2, alpha = alpha,
                      beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3, transformation = F)
  answer <- PairwiseOneOne(x1 = x1, x2 = x2, alpha = alpha,
                               beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3, transformation = F,
                               n.moments = 0)
  expect_equal(val, answer)
})

test_that("Single PL term with transformation", {
  t1 <- 1
  t2 <- 5

  alpha <- -5
  beta <- 3
  kappa <- 2
  rho <- 0.2

  B1 <- ComputeB1Exp(rho = rho, t1 = t1, t2 = t2)
  B2 <- ComputeBInterExp(rho = rho, t1 = t1, t2 = t2)
  B3 <- ComputeB3Exp(rho = rho, t1 = t1, t2 = t2)

  # 0-0
  x1 <- 0
  x2 <- 0
  val <- SinglePairPL(x1 = x1, x2 = x2, alpha = alpha, B1 = B1, B2 = B2, B3 = B3,
                      beta = beta, kappa = kappa, transformation = T, n.moments = 0)
  answer <- PairwiseZeroZero(alpha = alpha,  B1 = B1, B2 = B2, B3 = B3,
                                beta = beta, kappa = kappa)
  expect_equal(val, answer)

  # 1-0
  x1 <- 2
  x2 <- 0
  val <- SinglePairPL( x1 = x1,  x2 = x2, alpha = alpha, B1 = B1, B2 = B2, B3 = B3,
                      beta = beta, kappa = kappa, transformation = T, n.moments = 0)
  answer <- PairwiseOneZero( x1 = x1,  alpha = alpha,
                               beta = beta, kappa = kappa, B1 = B1, B2 = B2, B3 = B3,
                             transformation = T,
                               n.moments = 0)
  expect_equal(val, answer)

  # 1-1
  x1 <- 2
  x2 <- 5
  val <- SinglePairPL( x1 = x1,  x2 = x2, alpha = alpha,  B1 = B1, B2 = B2, B3 = B3,
                      beta = beta, kappa = kappa, transformation = T, n.moments = 0)
  answer <- PairwiseOneOne( x1 = x1,  x2 = x2, alpha = alpha,  B1 = B1, B2 = B2, B3 = B3,
                           beta = beta, kappa = kappa, transformation = T,
                           n.moments = 0)
  expect_equal(val, answer)
})



