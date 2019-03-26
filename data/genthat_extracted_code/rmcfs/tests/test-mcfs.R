context("mcfs")

#devtools::use_testthat()
#devtools::use_test("test.mcfs")

test_that("MCFS artificial data", {
  options(java.parameters = "-Xmx4g")
  require(testthat)
  require(rmcfs)
  
  ####################################
  ######### Artificial data ##########
  ####################################

  # create input data and review it
  adata <- artificial.data(rnd_features = 10, seed = 1)
  showme(adata)
  
  # Parametrize and run MCFS-ID procedure
  result <- mcfs(class~., adata, cutoffPermutations = 3, featureFreq = 50,
                 buildID = TRUE, finalCV = TRUE, finalRuleset = FALSE, 
                 threadsNumber = 1, seed = 1)
  
  expect_that(result, is_a("mcfs"))
  expect_that(all(c('RI','ID') %in% names(result)), is_true())
  expect_that(result$params$mcfs.cutoffPermutations, equals(3))
  expect_that(result$cutoff_value, equals(6))
  expect_that(nrow(result$distances), equals(18))
  expect_that(nrow(result$RI), equals(16))
  expect_that(nrow(result$distances), equals(18))
})