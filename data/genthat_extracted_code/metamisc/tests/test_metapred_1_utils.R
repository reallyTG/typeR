context("metapred 1. utility functions")

test_that("Generating a block diagonal matrix works", {
  m1 <- matrix(c(1,2,3,4), nrow=2, ncol=2)
  m2 <- matrix(c(5,6,7,8), nrow=2, ncol=2)
  m3 <- matrix(c(9,10,11,12), nrow=2, ncol=2)
  
  m_block <- blockMatrixDiagonal(m1, m2, m3)
  m_eval <- matrix(c(1,2,0,0,0,0,3,4,0,0,0,0,0,0,5,6,0,0,0,0,7,8,0,0,0,0,0,0,9,10,0,0,0,0,11,12), nrow=6, ncol=6)
  expect_identical(m_block, m_eval)
  
  m_list <- list(m1, m2, m3)
  m_block2 <- blockMatrixDiagonal(m_list)
  expect_identical(m_block2, m_eval)
})

test_that ("Multivariate meta-analysis works", {
  
  # Reconstruct berkey98 data from mvmeta
  m1 <- matrix(c(0.0075, 0.0030, 0.0030, 0.0077), nrow = 2, ncol = 2)
  m2 <- matrix(c(0.0057, 0.0009, 0.0009, 0.0008), nrow = 2, ncol = 2)
  m3 <- matrix(c(0.0021, 0.0007, 0.0007, 0.0014), nrow = 2, ncol = 2)
  m4 <- matrix(c(0.0029, 0.0009, 0.0009, 0.0015), nrow = 2, ncol = 2)
  m5 <- matrix(c(0.0148, 0.0072, 0.0072, 0.0304), nrow = 2, ncol = 2)
  m_full <- array(NA, dim=c(2,2,5))
  m_full[,,1] <- m1
  m_full[,,2] <- m2
  m_full[,,3] <- m3
  m_full[,,4] <- m4
  m_full[,,5] <- m5
  colnames(m_full) <- rownames(m_full) <- c("PD", "AL")
  
  y <- data.frame(PD = c(0.47, 0.20, 0.40, 0.26, 0.56), AL = c(-0.32, -0.60, -0.12, -0.31, -0.39))
  
  m_block <- blockMatrixDiagonal(m1, m2, m3, m4, m5)
  m_dat <- data.frame(y = c(0.47, -0.32, 0.20, -0.60, 0.40, -0.12, 0.26, -0.31, 0.56, -0.39),
                      group = c("PD", "AL", "PD", "AL", "PD", "AL", "PD", "AL", "PD", "AL"),
                      study = c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5))
  
  m_fit <- rma.mv(yi = y, V = m_block, mods = ~ -1+group, random = ~ group|study, struct= "UN", data = m_dat)

  mrma_fit <- mrma(coefficients = y, vcov = m_full)
  expect_identical(as.numeric(coefficients(m_fit)["groupAL"]), as.numeric(mrma_fit$coefficients["groupAL"]))
  expect_identical(as.numeric(coefficients(m_fit)["groupPD"]), as.numeric(mrma_fit$coefficients["groupPD"]))
  
  # Compare results with mvmeta
  # mvmeta(cbind(PD,AL),S=berkey98[5:7],data=berkey98)
  expect_equal(as.numeric(coefficients(m_fit)["groupAL"]), -0.3392152, tolerance = 0.0001)
  expect_equal(as.numeric(coefficients(m_fit)["groupPD"]),  0.3534282, tolerance = 0.0001)
  
  # Test whether mrma works when we only have one dimension
  y_uv <- y[,1]
  vcov_uv <- c(m1[1,1], m2[1,1], m3[1,1], m4[1,1], m5[1,1])
  mrma_fit_uv <- mrma(coefficients = y_uv, vcov = vcov_uv)
  
})

### Some stuff necessary for testing
n <- 2
td <- data.frame(y = rep(0, n * 4), x = rep(0, n * 4), z = c(rep(0, n * 2), rep(1, n * 2)), s = rep(c(rep(0, n), rep(1, n)), 2))

test_that("Centering within clusters works.", {
  expect_true(is.data.frame(cd <- metamisc:::centerCovs(data = td, y.name = "y", cluster.name = "s") ))
  expect_identical(cd$y, td$y)
  expect_identical(cd$x, rep(0, n * 4))
  expect_identical(cd$z, c(rep(-.5, n * 2), rep(.5, n * 2)))
  expect_identical(cd$s, td$s)
})

test_that("Centering within a single works.", {
  expect_true(is.data.frame(cd <- metamisc:::centerCovs(data = td, y.name = "y", cluster.name = "x") ))
  expect_identical(cd$y, td$y)
  expect_identical(cd$x, td$x)
  expect_identical(cd$z, c(rep(-.5, n * 2), rep(.5, n * 2)) )
  expect_identical(cd$s, rep(c(-.5, -.5, .5, .5), 2) )
})

# Deprecated
# test_that("asDataList and Reduce are complements.", {
#   expect_true(is.list(dl <- metamisc:::asDataList(td, td$z)))
#   expect_identical(td, Reduce(rbind, dl)) # Note that this is not always true. But with these parameters it should.
# })

tds <- 1:20

test_that("l1o produces val and dev", {
  expect_true(is.list(cv.l1o <- metamisc:::l1o(tds)))
  expect_true(is.list(cv.l1o$val))
  expect_true(is.list(cv.l1o$dev))
})

test_that("bootstrap produces val and dev", {
  expect_true(is.list(cv.bootstrap <- metamisc:::bootstrap(tds)))
  expect_true(is.list(cv.bootstrap$val))
  expect_true(is.list(cv.bootstrap$dev))
})

test_that("fixed produces val and dev", {
  expect_true(is.list(cv.fixed <- metamisc:::fixed(tds)))
  expect_true(is.list(cv.fixed$val))
  expect_true(is.list(cv.fixed$dev))
})

test_that("successive produces val and dev", {
  expect_true(is.list(cv.successive <- metamisc:::successive(tds)))
  expect_true(is.list(cv.successive$val))
  expect_true(is.list(cv.successive$dev))
})

### Some stuff necessary for testing
set.seed(8092017)
n <- 100
n.cov <- 3
td <- data.frame(matrix(rbinom(n * (n.cov + 1), 1, .5), ncol = n.cov + 1, nrow = n))
td.ig <- td + 1 # For inverse gaussian and Gamma.

### To be included:
# one-stage
# predFUN.
# Tests for options of predict.metapred

test_that("The predict functions predict accurately.", {
  m.bi <- glm(td, family = binomial)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.bi, two.stage = TRUE)))
  expect_true(all(unlist(pm(m.bi, td, coef(m.bi))) == unlist(m.bi$fitted.values))) # == intentionally ignores names.
  
  m.lm <- lm(td)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.lm, two.stage = TRUE)))
  expect_true(all.equal(unlist(pm(m.lm, td, coef(m.lm))) ,as.matrix(unlist(m.lm$fitted.values)),
                        use.names = F, check.attributes = F)) # also intentionally ignores names.
  
  m.no <- glm(td)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.no, two.stage = TRUE)))
  expect_true(all(unlist(pm(m.no, td, coef(m.no))) == unlist(m.no$fitted.values))) # == intentionally ignores names.
  
  m.gm <- glm(td.ig, family = Gamma)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.gm, two.stage = TRUE)))
  expect_true(all.equal(unlist(pm(m.gm, td.ig, coef(m.gm))) ,as.matrix(unlist(m.gm$fitted.values)),
                        use.names = F, check.attributes = F)) # also intentionally ignores names.
  
  m.ig <- glm(td.ig, family = inverse.gaussian)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.ig, two.stage = TRUE)))
  expect_true(all(unlist(pm(m.ig, td.ig, coef(m.ig))) == unlist(m.ig$fitted.values))) # == intentionally ignores names.
  
  m.po <- glm(td, family = poisson)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.po, two.stage = TRUE)))
  expect_true(all(unlist(pm(m.po, td, coef(m.po))) == unlist(m.po$fitted.values))) # == intentionally ignores names.
  
  m.q <- glm(td, family = quasi)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.q, two.stage = TRUE)))
  expect_true(all.equal(unlist(pm(m.q, td, coef(m.q))) ,as.matrix(unlist(m.q$fitted.values)),
                        use.names = F, check.attributes = F)) # also intentionally ignores names.
  
  m.qb <- glm(td, family = quasibinomial)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.qb, two.stage = TRUE)))
  expect_true(all(unlist(pm(m.qb, td, coef(m.qb))) == unlist(m.qb$fitted.values))) # == intentionally ignores names.
  
  m.qp <- glm(td, family = quasipoisson)
  expect_true(is.function(pm <- metamisc:::getPredictMethod(m.qp, two.stage = TRUE)))
  expect_true(all.equal(unlist(pm(m.qp, td, coef(m.qp))) ,as.matrix(unlist(m.qp$fitted.values)),
                        use.names = F, check.attributes = F)) # also intentionally ignores names.
})
