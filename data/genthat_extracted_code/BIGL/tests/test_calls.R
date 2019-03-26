context("maxR calls for synergy/antagonism")

test_that("calls", {

  ## Decreasing marginal curves
  sims <- genData(parsDec, 2, -1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Syn")

  sims <- genData(parsDec, 2, 1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Ant")

  ## Increasing marginal curves
  sims <- genData(parsInc, 2, 1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Syn")

  sims <- genData(parsInc, 2, -1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Ant")

  ## Diverging marginal curves
  sims <- genData(parsDiv, 2, 1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Undefined")

  sims <- genData(parsDiv, 2, -1)
  rs <- fitSurface(sims$data, sims$pars, statistic = "maxR",
                   B.CP = 2, B.B = NULL, parallel = FALSE)
  expect_equal(rs$maxR$Call, "Undefined")


})

test_that("calls with no replicates", {
      
      ## Decreasing marginal curves
      sims <- genData(parsDec, 1, -1)
      rs <- fitSurface(sims$data, sims$pars, statistic = "both",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Syn")
      
      expect_error(rs <- fitSurface(sims$data, sims$pars, statistic = "both",
              B.CP = 2, B.B = NULL, parallel = FALSE, method = "model"),
          "Replicates are required")
      
      expect_error(rs <- fitSurface(sims$data, sims$pars, statistic = "both",
              B.CP = 2, B.B = NULL, parallel = FALSE, method = "unequal"),
          "Replicates are required")
      
    })

test_that("HSA calls", {
      
      ## Decreasing marginal curves
      sims <- genData(parsDec, 2, -1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "hsa", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Syn")
      
      sims <- genData(parsDec, 2, 1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "hsa", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Ant")
      
      ## Increasing marginal curves
      sims <- genData(parsInc, 2, 1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "hsa", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Syn")
      
      sims <- genData(parsInc, 2, -1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "hsa", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Ant")
            
    })

test_that("Bliss calls", {
      
      ## Decreasing marginal curves
      sims <- genData(parsDec, 2, -1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Syn")
      
      sims <- genData(parsDec, 2, 1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Ant")
      
      ## Increasing marginal curves
      sims <- genData(parsInc, 2, 1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Syn")
      
      sims <- genData(parsInc, 2, -1)
      rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
          B.CP = 2, B.B = NULL, parallel = FALSE)
      expect_equal(rs$maxR$Call, "Ant")
      
      ## Diverging marginal curves
      sims <- genData(parsDiv, 2, 1)
      expect_error(
          rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
              B.CP = 2, B.B = NULL, parallel = FALSE),
          "Bliss independence does not work for diverging marginal curves")
      
      sims <- genData(parsDiv, 2, -1)
      expect_error(
          rs <- fitSurface(sims$data, sims$pars, null_model = "bliss", statistic = "maxR",
              B.CP = 2, B.B = NULL, parallel = FALSE),
          "Bliss independence does not work for diverging marginal curves")
      
    })
