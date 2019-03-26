context("correct numerical solution")

test_that("correct PLR-LS", {
  
  data(fuzzydat)
  expect_equivalent(fuzzylm(y ~ x, data = fuzzydat$lee, method = "plrls")$coef,  
               matrix(c(17.761911, 2.746428, .7619108, 1.2464280, 2.7380892, .4202387), ncol = 3),
               tolerance = 1e-6)
  
})

test_that("correct PLR", {
  
  data(fuzzydat)
  expect_equivalent(fuzzylm(y ~ x, fuzzydat$tan, "plr", , , "yl", "yr")$coef,  
                    matrix(c(3.85, 2.1, 3.85, 0, 3.85, 0), ncol = 3),
                    tolerance = 1e-3)
  
})

test_that("correct FLS", {

  data(fuzzydat)
  expect_equivalent(fuzzylm(y ~ x, fuzzydat$dia, "fls", , , "yl", "yl")$coef,
                    matrix(c(1.375, .1475, .1475, .1204, .025, .025), ncol = 3, byrow = TRUE),
                    tolerance = 1e-4)
})

test_that("correct MOFLR", {
  
  data(fuzzydat)
  expect_equivalent(fuzzylm(y ~ x, fuzzydat$nas, "moflr", "xl", , "yl")$coef,
                    matrix(c(6.07, 7.84, 7.84, 1.67, .48, .48), ncol = 3, byrow = TRUE),
                    tolerance = 1e-3)
})


test_that("correct OPLR", {
  
  data(fuzzydat)
  expect_equivalent(fuzzylm(y ~ x, fuzzydat$hun, "oplr", , , "yl", "yl")$coef,
                    matrix(c(4.15, 3.95, 3.95, 2, 0, 0), ncol = 3, byrow = TRUE),
                    tolerance = 1e-3)
})


test_that("correct TEF for crisp numbers", {

  f = fuzzylm(y ~ x, data = data.frame(x = 1:3, y = 2:4))
  expect_equal(0, 
               TEF(f),
               tolerance = 1e-6)
})

test_that("correct TEF for TFN using PLR by Tanaka et al.", {

  data(fuzzydat)
  f = fuzzylm(y ~ x, fuzzydat$tan, "plr", , , "yl", "yr")
  expect_equal(TEF(f),
               5.6,
               tolerance = 1e-2)
})



test_that("correct PLRLS with bats data", {

  data(bats)
  dat = bats[!(bats$MAST < 0 & bats$temperature > 7),]
  f = fuzzylm(temperature ~ MAST, dat, "plrls", h = 0.01, k1 = 5)
  expect_equivalent(f$coef,
                    matrix(c(2.51,4.15,3.24,.61,0,.03), ncol = 3, byrow = TRUE),
                    tolerance = 1e-2)
})

test_that("correct fuzzify for mean", {

   f = fuzzify(1:3)
   expect_equivalent(f,
                     data.frame(matrix(c(2, 1, 1, 1), nrow = 1)),
                     tolerance = 1e-6)
})

test_that("correct fuzzify for median non-symmetric", {

   f = fuzzify(c(1:3, 5), method = "median")
   expect_equivalent(f,
                     data.frame(matrix(c(2.5, .75, 1, 1), nrow = 1)),
                     tolerance = 1e-6)
})

test_that("correct fuzzify for err", {

   expect_equivalent(fuzzify(1:2, method = "error", err = 1),
                     data.frame(matrix(c(1, 2, 1, 1, 1, 1, 1, 1), nrow = 2)),
                     tolerance = 1e-6)
   expect_equivalent(fuzzify(1:2, method = "error", err = 1:2),
                     data.frame(matrix(c(1, 2, 1, 2, 1, 2, 1, 1), nrow = 2)),
                     tolerance = 1e-6)
   expect_equivalent(fuzzify(1:2, method = "error", err = 1:4),
                     data.frame(matrix(c(1, 2, 1, 2, 3, 4, 1, 1), nrow = 2)),
                     tolerance = 1e-6)
   expect_equivalent(fuzzify(1:2, y = 1:2, method = "error", err = 1:4),
                     data.frame(matrix(c(1, 2, 1, 2, 3, 4, 1, 2), nrow = 2)),
                     tolerance = 1e-6)
})


